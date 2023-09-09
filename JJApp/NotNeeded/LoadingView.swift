//
//  LoadingView.swift
//  JJApp
//
//  Created by Arnella Tolegen on 01.08.2023.
//

//import SwiftUI
//
//struct LoadingView: View {
//    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
//    @Environment(\.managedObjectContext) var moc
//
//    @State var language = ""
//    @State var isChosen = false
//    var body: some View {
//        NavigationView{
//            VStack{
//                Button(action: {
//                    language = "KZ"
//                    chooseLanguage()
//                }, label: {
//                    NavigationLink(destination: LogInView(), label: {
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
//                                .frame(width: 200, height: 50)
//                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
//                            RoundedRectangle(cornerRadius: 10)
//                                .foregroundColor(Color.white)
//                                .frame(width: 198, height: 48)
//                            Text("Қазақша").foregroundColor(.black)
//                                .font(.system(size: 30))
//                        }
//                    })
//
//                })
//
//                Button(action: {
//                    language = "EN"
//                    chooseLanguage()
//                }, label: {
//                    NavigationLink(destination: LogInView(), label: {
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
//                                .frame(width: 200, height: 50)
//                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
//                            RoundedRectangle(cornerRadius: 10)
//                                .foregroundColor(Color.white)
//                                .frame(width: 198, height: 48)
//                            Text("English").foregroundColor(.black)
//                                .font(.system(size: 30))
//                        }
//                    })
//                })
//
//                Button(action: {
//                    language = "RU"
//                }, label: {
//                    NavigationLink(destination: LogInView(), label: {
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
//                                .frame(width: 200, height: 50)
//                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
//                            RoundedRectangle(cornerRadius: 10)
//                                .foregroundColor(Color.white)
//                                .frame(width: 198, height: 48)
//                            Text("Русский").foregroundColor(.black)
//                                .font(.system(size: 30))
//                        }
//                    })
//                })
//                
//                NavigationLink(destination: LogInView(), isActive: $isChosen, label: {EmptyView()})
//
//            }
//        }
//    }
//    func chooseLanguage() {
//        let language1 = LanguageDB(context: moc)
//        language1.language = language
//        try? moc.save()
//        print(languageDB[0])
//        isChosen = true
//    }
//}
//
//struct LoadingView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoadingView()
//    }
//}
