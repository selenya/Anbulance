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

struct AnimalDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                    print("kurtarıldı")
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
                })
            Button(
                action: {
                    print("raporlar")
                },
                label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 350, height: 50, alignment: .center)
                            .foregroundColor(.gray)
                            .cornerRadius(8)
                        Text("Bu paylaşımı bildir")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                    }
                })
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
    
    
    struct ReportView_Previews: PreviewProvider {
        static var previews: some View {
            AnimalDetailView()
        }
    }
}
