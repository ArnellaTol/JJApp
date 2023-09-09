//
//  LoginTextNature.swift
//  JJApp
//
//  Created by Arnella Tolegen on 07.03.2023.
//

import SwiftUI

struct LoginTextNature: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    @Binding var language: String
    var body: some View {
        VStack{
            Group{
                if language == "RU"{
                    Text("Вход в JJApp")
                        .font(.system(size: 40))
                        .tracking(0.1)
                        .bold()
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .padding(0.1)
                    Text("С заботой о природе")
                        .font(.system(size: 19))
                        .foregroundColor(.black)
                        .bold()
                        .padding(0.1)
                }
                else if language == "EN"{
                    Text("JJApp login")
                        .font(.system(size: 40))
                        .tracking(0.1)
                        .bold()
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .padding(0.1)
                    Text("With care for nature")
                        .font(.system(size: 19))
                        .foregroundColor(.black)
                        .bold()
                        .padding(0.1)
                }
                else{
                    Text("JJApp қосымшасына кіру")
                        .font(.system(size: 30))
                        .tracking(0.1)
                        .bold()
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .padding(0.1)
                    Text("Көгалдандыруға өз үлесіңді қос")
                        .font(.system(size: 19))
                        .foregroundColor(.black)
                        .bold()
                        .padding(0.1)
                }
            }
        }
    }
}

struct LoginTextNature_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextNature(language: .constant(""))
    }
}
