//
//  AnimalDetailView.swift
//  Anbulance
//
//  Created by Selen Yanar on 10/08/21.
//

import Foundation
import SwiftUI
import FirebaseUI
import SDWebImageSwiftUI
import FirebaseFirestore

struct AnimalDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showAlert = false
    @State var showFlagView = false
    
    var btnBack : some View {
        Button(
            action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
            Text("< Geri")
                .foregroundColor(Color("AnbulanceBlue"))
            
        }
    }
    
    
    var animalAnnotation: AnimalAnnotation?
    
    var body: some View {
        VStack {
            
            // USE PLACEHOLDER IMAGE IF NONE AVAILABLE
            let imageUrl = animalAnnotation?.imageUrl ?? "https://via.placeholder.com/468x300?text=No%20image"
            WebImage(url: URL(string: imageUrl)).resizable().scaledToFit()
                .frame(width: 350.0, height: 300.0)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
            
            Text(animalAnnotation?.title ?? "")
                .frame(width: 350.0, height: 250.0)
                .foregroundColor(Color("AnbulanceBlue"))
            Button(
                action: {
                    MapModel().openMapForPlace(coordinates: animalAnnotation!.coordinate)
                },
                label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 350, height: 50, alignment: .center)
                            .foregroundColor(Color("AnbulanceBlue"))
                            .cornerRadius(8)
                        Text("Konuma git")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                    }
                })
            Button(
                action: {
                    print("Kurtarıldı")
                    showAlert = true
                },
                label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 350, height: 50, alignment: .center)
                            .foregroundColor(Color("AnbulanceGreen"))
                            .cornerRadius(8)
                        Text("Kurtarıldı")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                    }
                }).alert(isPresented: $showAlert,
                         content: {
                            Alert(
                                title: Text("Yaralı hayvan kurtarıldı mı?"),
                                message: Text("Evet'i seçersen bu gönderi haritadan silinecek. Bu işlem geri alınamaz."),
                                primaryButton: .cancel(Text("İptal")),
                                secondaryButton: .destructive(
                                    Text("Evet"),
                                    action: {FirebaseService().deletePost(withID: animalAnnotation!.postID!); presentationMode.wrappedValue.dismiss()
                                    }
                                ))
                         })
            Button(action: {
                self.showFlagView.toggle()
            }, label: {
                Text("Bu gönderiyi bildir")
                    .fontWeight(.bold)
                    .foregroundColor(Color("AnbulanceBlue"))
                    .padding(.leading, 180.0)
            })
            .padding(.top, 10)
            .padding(.bottom, 50.0)
            .alert(isPresented: $showFlagView,
                     content: {
                        Alert(
                            title: Text("Bu gönderiyi bildirmek istiyor musun?"),
                            message: Text("Eğer bu gönderinin uygulamanın kullanım amacına aykırı olduğunu düşünüyorsan 'Evet'i seç."),
                            primaryButton: .cancel(Text("İptal")),
                            secondaryButton: .destructive(
                                Text("Evet, bu gönderiyi bildir."),
                                action: {
                                    
                                    addReportData()
                                    presentationMode.wrappedValue.dismiss()
                                }
                            ))
                     })
        }
        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
    
    
    func addReportData() {
        let db = Firestore.firestore()
        db.collection("reported").document(animalAnnotation!.postID!).setData([
            "postID": animalAnnotation!.postID!
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added successfully.")
            }
        }
        
    }

    
    struct ReportView_Previews: PreviewProvider {
        static var previews: some View {
            AnimalDetailView()
        }
    }
 
    
}
