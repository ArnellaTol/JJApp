//
//  SettingsButton.swift
//  JJApp
//
//  Created by ITSTEP on 16.03.2023.
//

import SwiftUI

struct TextBlackSettings: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18))
            .foregroundColor(.black)
            
    }
}
struct SettingsButton: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc

    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 202, height: 61)
                .foregroundColor(Color(red: 0.21, green: 0.493, blue: 0.248))
                .shadow(radius: 2)
                
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 200, height: 60)
                .foregroundColor(.white)
            HStack{
                if languageDB[0].language == "KZ"{
                    Image("Setting")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70)
                        
                    //.offset(x: -64, y: -8)
                } else {
                    Image("Setting")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70)
                        
                    //.offset(x: -60, y: -8)
                }
                //Spacer()
                if languageDB[0].language == "RU"{
                    VStack {
                        Text("Настройки")
                            .modifier(TextBlackSettings())
                            
                        Text("профиля")
                            .modifier(TextBlackSettings())
                            
                    } //.offset(x: 36)
                }
                else if languageDB[0].language == "EN"{
                    VStack {
                        Text("Profile")
                            .modifier(TextBlackSettings())
                            
                        Text("Settings")
                            .modifier(TextBlackSettings())
                            .padding(.horizontal, 3)
                    } //.offset(x: 25)
                }
                else{
                    VStack {
                        Text("Профиль")
                            .font(.system(size: 17))
                            .foregroundColor(.black)
                            
                        Text("параметрлер")
                            .font(.system(size: 17))
                            .foregroundColor(.black)
                            
                    } //.offset(x: 27)
                }
            }.frame(width: 200)
        }
    }
}

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton()
    }
}
