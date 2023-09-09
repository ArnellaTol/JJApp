//
//  UserInList.swift
//  JJApp
//
//  Created by ITSTEP on 11.05.2023.
//
// Это RatingPosition.swift только без переменной JJCoins

import SwiftUI

//struct UserInList: View {
//    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
//    @Environment(\.managedObjectContext) var moc
//    var name: String
//    var body: some View {
//        NavigationLink {
//            UserProfileCuratorView()
//        } label: {
//            ZStack {
//                RoundedRectangle(cornerRadius: 15)
//                    .fill(LinearGradient(colors: [Color(red: 0.621, green: 0.805, blue: 0.42), Color(red: 0.932, green: 1.002, blue: 0.862) ], startPoint: .leading, endPoint: .trailing))
//                    .frame(width: 300, height: 80)
//                    .shadow(color: .gray, radius: 2, x: 0, y: 4)
//                HStack() {
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(.white)
//                            .frame(width: 60, height: 60)
//                        Image("NoProfileFoto")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 30)
//                    } //ZStack
//                    Text(name)
//                        .font(.system(size: 18))
//                        .foregroundColor(.black)
//                        .padding()
//                        .frame(width: 150)
//                } .frame(width: 300, height: 80)
//            }//ZStack
//        }
//    }
//}
//
//struct UserInList_Previews: PreviewProvider {
//    static var previews: some View {
//        UserInList( name: "Gleb Ptushkin")
//    }
//}
