//
//  ButtonChangePhoto.swift
//  JJApp
//
//  Created by Arnella Tolegen on 01.04.2023.
//

import SwiftUI

struct ButtonChangePhoto: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                .frame(width: 300, height: 40)
    
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .frame(width: 298, height: 38)
            
            if languageDB[0].language == "RU"{
                Text("Изменить фото профиля")
                    .foregroundColor(Color(red: 0.473, green: 0.58, blue: 0.478))
                    
            }
            else if languageDB[0].language == "EN"{
                Text("Change your profile photo")
                    .foregroundColor(Color(red: 0.473, green: 0.58, blue: 0.478))
            }
            else{
                Text("Профиль фотосуретін өзгерту")
                    .foregroundColor(Color(red: 0.473, green: 0.58, blue: 0.478))
            }
        }
    }
}

struct ButtonChangePhoto_Previews: PreviewProvider {
    static var previews: some View {
        ButtonChangePhoto()
    }
}
