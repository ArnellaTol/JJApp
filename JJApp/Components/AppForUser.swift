//
//  AppForUser.swift
//  JJApp
//
//  Created by Arnella Tolegen on 13.06.2023.
//

import SwiftUI

struct AppForUser: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    @State var title: String
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(colors: [Color(red: 0.621, green: 0.805, blue: 0.42), Color(red: 0.932, green: 1.002, blue: 0.862) ], startPoint: .leading, endPoint: .trailing))
                .frame(width: 320, height: 50)
                .shadow(color: .gray, radius: 2, x: 0, y: 4)
            HStack {
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                Spacer()
                
//                if languageDB[0].language == "RU"{
//                    Text("просмотр")
//                        .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282))
//                        .padding(.horizontal, 30)
//                        .padding(.vertical, 10)
//                }
//                else if languageDB[0].language == "EN"{
//                    Text("view")
//                        .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282))
//                        .padding(.horizontal, 30)
//                        .padding(.vertical, 10)
//                }
//                else{
//                    Text("көру")
//                        .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282))
//                        .padding(.horizontal, 30)
//                        .padding(.vertical, 10)
//                }
            }.frame(width: 300, height: 50)
        }
    }
}

struct AppForUser_Previews: PreviewProvider {
    static var previews: some View {
        AppForUser(title: "")
    }
}
