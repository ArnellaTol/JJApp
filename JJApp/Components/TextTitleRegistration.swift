//
//  TextTitleRegistration.swift
//  JJApp
//
//  Created by Arnella Tolegen on 21.03.2023.
//

import SwiftUI

struct TextTitleRegistration: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        if languageDB[0].language == "RU"{
            Text("Заполните поля для регистрации:")
                .font(.system(size: 20))
                .bold()
                .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                .padding(10)
                .frame(width: 250)
                .multilineTextAlignment(.center)
            
        }
        else if languageDB[0].language == "EN"{
            Text("Fill in the registration fields:")
                .font(.system(size: 20))
                .bold()
                .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                .padding(10)
                .frame(width: 250)
                .multilineTextAlignment(.center)
            
        }
        else{
            Text("Тіркелу өрістерін толтырыңыз:")
                .font(.system(size: 20))
                .bold()
                .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                .padding(10)
                .frame(width: 250)
                .multilineTextAlignment(.center)
            
        }
    }
}

struct TextTitleRegistration_Previews: PreviewProvider {
    static var previews: some View {
        TextTitleRegistration()
    }
}
