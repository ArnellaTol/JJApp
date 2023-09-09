//
//  ChangeFotoCurator.swift
//  JJApp
//
//  Created by ITSTEP on 13.05.2023.
//

import SwiftUI

struct ChangeFotoCurator: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        
        Button {
            //change foto
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: .leading, endPoint: .trailing))
                    .frame(width: 300, height: 100)
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .frame(width: 298, height: 97.5)
                HStack {
                    ZStack{
                        Circle()
                            .frame(width: 75)
                            .foregroundColor(Color(red: 0.366, green: 0.598, blue: 0.269))
//                            .shadow(radius: 4)
                        
                        Circle()
                            .frame(width: 73)
                            .foregroundColor(Color(red: 0.925, green: 0.925, blue: 0.925))
                        
                        Image("NoProfileFoto")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 40)
                    }
                    
                    if languageDB[0].language == "RU"{
                        Text("Изменить фото \nпрофиля")
                            .foregroundColor(Color(red: 0.473, green: 0.58, blue: 0.478))
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 50)
                            .padding(.leading, 10)
                        
                            
                    }
                    else if languageDB[0].language == "EN"{
                        Text("Change your \nprofile photo")
                            .foregroundColor(Color(red: 0.473, green: 0.58, blue: 0.478))
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 70)
                            .padding(.leading, 10)
                    }
                    else{
                        Text("Профиль \nфото өзгерту")
                            .foregroundColor(Color(red: 0.473, green: 0.58, blue: 0.478))
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 60)
                            .padding(.leading, 10)
                    }
                } //Hstack
            } //ZStack
        } //Label (Button)
    } //body
} //struct

struct ChangeFotoCurator_Previews: PreviewProvider {
    static var previews: some View {
        ChangeFotoCurator()
    }
}
