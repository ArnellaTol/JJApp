//
//  Language.swift
//  JJApp
//
//  Created by ITSTEP on 24.02.2023.
//

//if language == "RU"{
//    
//}
//else if language == "EN"{
//    
//}
//else{
//    
//}

import SwiftUI

struct Language: View {
    //    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    //    @Environment(\.managedObjectContext) var moc
    //    @Binding var language: String
    var body: some View {
        //
        //        //Languages
        //        HStack{
        //            Button(action: {
        //                saveLanguage(l: "KZ")
        //                language = (languageDB[0].language ?? "KZ")
        //            }){
        //                ZStack{
        //                    RoundedRectangle(cornerRadius: 10)
        //                        .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
        //                        .frame(width: 67, height: 47)
        //                        .shadow(color: .gray, radius: 2, x: 0, y: 3)
        //                    RoundedRectangle(cornerRadius: 10)
        //                        .foregroundColor(Color.white)
        //                        .frame(width: 65, height: 45)
        //                    Text("KZ")
        //                        .foregroundColor(.black)
        //                }
        //            }.padding()
        //
        //            Button(action: {
        //                saveLanguage(l: "RU")
        //                language = (languageDB[0].language ?? "RU")
        //            }){
        //                ZStack{
        //                    RoundedRectangle(cornerRadius: 10)
        //                        .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
        //                        .frame(width: 67, height: 47)
        //                        .shadow(color: .gray, radius: 2, x: 0, y: 3)
        //                    RoundedRectangle(cornerRadius: 10)
        //                        .foregroundColor(Color.white)
        //                        .frame(width: 65, height: 45)
        //                    Text("RU")
        //                        .foregroundColor(.black)
        //                }
        //            }.padding()
        //
        //            Button(action: {
        //                saveLanguage(l: "EN")
        //                language = (languageDB[0].language ?? "EN")
        //            }){
        //                ZStack{
        //                    RoundedRectangle(cornerRadius: 10)
        //                        .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
        //                        .frame(width: 67, height: 47)
        //                        .shadow(color: .gray, radius: 2, x: 0, y: 3)
        //                    RoundedRectangle(cornerRadius: 10)
        //                        .foregroundColor(Color.white)
        //                        .frame(width: 65, height: 45)
        //                    Text("EN")
        //                        .foregroundColor(.black)
        //                }
        //            }.padding()
        //
        //        }
        
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
                .frame(width: 67, height: 47)
                .shadow(color: .gray, radius: 2, x: 0, y: 3)
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.white)
                .frame(width: 65, height: 45)
        }
        //    func saveLanguage(l: String) {
        //        let lang = LanguageDB(context: moc)
        //        lang.language = l
        //        try? moc.save()
        //    }
    }
}
struct Language_Previews: PreviewProvider {
    static var previews: some View {
        Language()
    }
}
