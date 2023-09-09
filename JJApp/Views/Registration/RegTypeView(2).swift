//
//  ChoosingRegistration.swift
//  JJApp
//
//  Created by Arnella Tolegen on 01.02.2023.
//
//Design: Ready


import SwiftUI
import UIKit

struct RegTypeView: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    @Environment (\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Background()
            VStack{
                
            
                Spacer()
                    .toolbar(content: {
                        ToolbarItem(placement: .navigationBarLeading, content: {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss ()
                            }, label: {Back()})
                        })
                    })
                
                //Выбор (Text)
                if languageDB[0].language == "RU"{
                    Text("Выбор регистрации")
                        .font(.system(size: 40))
                        .bold()
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .padding()
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                    
                }
                else if languageDB[0].language == "EN"{
                    Text("Registration selection")
                        .font(.system(size: 40))
                        .bold()
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .padding()
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                    
                }
                else{
                    Text("Тіркеуді таңдау")
                        .font(.system(size: 40))
                        .bold()
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .padding()
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                    
                }
                
                
                
                //Button "User"
                Group {
                    NavigationLink(destination: RegUserView(name: "", surname: "", login: "", password: "", repeatPassword: "", organisation: "", phoneNumber: "", email: ""), label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(LinearGradient(colors: [Color(red: 0.616, green: 0.805, blue: 0.415), Color(red: 0.937, green: 1.002, blue: 0.866)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color.green)
                                .shadow(color: .gray, radius: 3, x: 0, y: 3)
                            
                            if languageDB[0].language == "RU"{
                                Text("Пользователь").foregroundColor(Color(red: 0.378, green: 0.538, blue: 0.265))
                                    .font(.system(size: 20))
                            }
                            else if languageDB[0].language == "EN"{
                                Text("User").foregroundColor(Color(red: 0.378, green: 0.538, blue: 0.265))
                                    .font(.system(size: 20))
                            }
                            else{
                                Text("Пайдаланушы").foregroundColor(Color(red: 0.378, green: 0.538, blue: 0.265))
                                    .font(.system(size: 20))
                            }
                            
                        }.padding()
                    })
                    
                    
                    //Button "Admin"
                    
                    NavigationLink(destination: RegCuratorView(name: "", surname: "", login: "", password: "", repeatPassword: "", phoneNumber: "", cardNumber: "", email: "", organisation: ""), label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(LinearGradient(colors: [Color(red: 0.616, green: 0.805, blue: 0.415), Color(red: 0.937, green: 1.002, blue: 0.866)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color.green)
                                .shadow(color: .gray, radius: 3, x: 0, y: 3)
                            
                            
                            if languageDB[0].language == "EN"{
                                Text("Curator")
                                    .foregroundColor(Color(red: 0.378, green: 0.538, blue: 0.265))
                                    .font(.system(size: 20))
                            }
                            else{
                                Text("Куратор")
                                    .foregroundColor(Color(red: 0.378, green: 0.538, blue: 0.265))
                                    .font(.system(size: 20))
                            }
                            
                        }
                    })
                    
                }
                
                Spacer()
                    
                
            }
        }.navigationBarBackButtonHidden()
            
    }
}

struct RegTypeView_Previews: PreviewProvider {
    static var previews: some View {
        RegTypeView()
            .previewInterfaceOrientation(.portrait)
    }
}
