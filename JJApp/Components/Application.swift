//
//  Application.swift
//  JJApp
//
//  Created by ITSTEP on 18.04.2023.
//

import SwiftUI
//
//struct Application: View {
//    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
//    @Environment(\.managedObjectContext) var moc
//    var userName: String
//    var body: some View {
//       // VStack {
//
//            HStack {
//                Text(userName)
//                    .foregroundColor(.black)
//                .font(.system(size: 20))
//                .padding(.horizontal, 30)
//                .padding(.vertical, 10)
//                Spacer()
//
//                NavigationLink(destination: AppSeeView(userName: userName), label: {
//                    if languageDB[0].language == "RU"{
//                        Text("просмотр")
//                            .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282))
//                    }
//                    else if languageDB[0].language == "EN"{
//                        Text("view")
//                            .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282))
//                    }
//                    else{
//                        Text("көру")
//                            .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282))
//                    }
//                })
//                .padding(.horizontal, 30)
//                .padding(.vertical, 10)
//
//
//            }
////            HStack {
////                Button(action: {
////                    //
////                }, label: {
////                    ZStack {
////                        RoundedRectangle(cornerRadius: 7)
////                            .fill(.red)
////                            .frame(width: 152, height: 42)
////                            .shadow(radius: 2, y: 3)
////                        RoundedRectangle(cornerRadius: 7)
////                            .fill(.white)
////                            .frame(width: 150, height: 40)
////                        if language == "RU"{
////                            Text("Отклонить")
////                                .foregroundColor(.red)
////                        }
////                        else if language == "EN"{
////                            Text("Reject")
////                                .foregroundColor(.red)
////                        }
////                        else{
////                            Text("Бас тарту")
////                                .foregroundColor(.red)
////                        }
////
////                    }
////                })
////
////                Button(action: {
////                    //
////                }, label: {
////                    ZStack {
////                        RoundedRectangle(cornerRadius: 7)
////                            .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282))
////                            .frame(width: 152, height: 42)
////                            .shadow(radius: 2, y: 3)
////                        if language == "RU"{
////                            Text("Принять")
////                                .foregroundColor(.white)
////                        }
////                        else if language == "EN"{
////                            Text("Accept")
////                                .foregroundColor(.white)
////                        }
////                        else{
////                            Text("Қабылдау")
////                                .foregroundColor(.white)
////                        }
////
////                    }
////                })
//
////
////            }
//
//       // }
//
//    }
//}
//
//struct Application_Previews: PreviewProvider {
//    static var previews: some View {
//        Application(userName: "Arnella")
//    }
//}
