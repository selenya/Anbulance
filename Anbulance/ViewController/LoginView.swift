//
//  LoginView.swift
//  Anbulance
//
//  Created by Selen Yanar on 4.04.2021.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var btnBack : some View {
        Button(
            action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        Text("< Geri")
            .foregroundColor(Color("AnbulanceBlue"))
        }}
    
    @State var email = ""
    @State var parola = ""
    @State var visible = false
    @State var alert = false
    @State var error = ""
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        
        ZStack {
            
            ZStack {
                
                VStack {
                    Image("AnbulanceLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(80.0)
                        .edgesIgnoringSafeArea(.all)
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                        TextField("Email", text: self.$email)
                            .autocapitalization(.none)
                            .frame(width: 300, height: 50, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(8)
                            .foregroundColor(Color("AnbulanceBlue"))
                    }
                    HStack {
                        
                        Button(action: {
                            self.visible.toggle()
                            
                        }) {
                            Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(Color("AnbulanceBlue"))
                        }
                        
                        if self.visible {
                            TextField("Parola", text: self.$parola)
                                .autocapitalization(.none)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 300, height: 50, alignment: .center)
                                .cornerRadius(8)
                                .foregroundColor(Color("AnbulanceBlue"))
                            
                        } else {
                            SecureField("Parola", text: self.$parola)
                                .autocapitalization(.none)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 300, height: 50, alignment: .center)
                                .cornerRadius(8)
                                .foregroundColor(Color("AnbulanceBlue"))
                            
                        }
                        
                    }
                    
                    HStack {
                        Button(action: {
                            //Forgot password action
                            self.reset()
                            
                        }) {
                            
                            Text("Parolamı unuttum")
                                .fontWeight(.bold)
                                .foregroundColor(Color("AnbulanceBlue"))
                                .padding(.leading, 180.0)
                            
                        }
                    }
                    
                    Button(
                        action: {
                            self.verify()},
                        label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 300, height: 50, alignment: .center)
                                    .foregroundColor(Color("AnbulanceBlue"))
                                    .cornerRadius(8)
                                Text("Giriş yap")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                            }
                            
                        })
                        .padding(.top, 40.0)
                }
                
                
            }
            
            if self.alert {
                
                ErrorView(alert: self.$alert, error: self.$error)
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
    
    func verify() {
        
        if self.email != "" && self.parola != "" {
            
            Auth.auth().signIn(withEmail: self.email, password: self.parola) { res, err in
                
                if err != nil{
                    
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                print("Başarılı")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
            
            
        } else {
            self.error = "Lütfen bütün alanları doldurun"
            self.alert.toggle()
            
        }
    }
    
    func reset() {
        
        if self.email != "" {
            
            Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                
                if err != nil {
                    
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                    
                }
                
                self.error = "SIFIRLA"
                self.alert.toggle()
                
            }
        }
        else {
            self.error = "Lütfen email adresinizi girin"
            self.alert.toggle()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct ErrorView: View {
    
    @State var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error: String
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                HStack {
                    Text(self.error == "SIFIRLA" ? "Message" : "Hata")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                Text(self.error == "SIFIRLA" ? "Parolanızı sıfırlama E-Postası gönderildi." : self.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                Button(action: {
                    
                    self.alert.toggle()
                    
                }) {
                    
                    Text(self.error == "SIFIRLA" ? "OK" : "İptal")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width-120)
                }
                .background(Color("AnbulanceBlue"))
                .cornerRadius(10)
                .padding(.top, 25)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width-70)
            .background(Color.white)
            .cornerRadius(15)
            .border(Color("AnbulanceBlue"))
        }
    }
}

