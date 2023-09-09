//
//  UserListCuratorView.swift
//  JJApp
//
//  Created by ITSTEP on 11.05.2023.
//

import SwiftUI

struct UserListCuratorView: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var tokensDB: FetchedResults<TokensDB>
    @State var names: [UserInfoList] = []
    @State var msg = ""
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea(.all)
            TabCircle()
            VStack {
                HStack{
                    Button(action: {
                        saveLanguage(l: "KZ")
                    }){
                        ZStack{
                            Language()
                            Text("KZ")
                                .foregroundColor(.black)
                        }
                    }.padding()
                    
                    Button(action: {
                        saveLanguage(l: "EN")
                    }){
                        ZStack{
                            Language()
                            Text("EN")
                                .foregroundColor(.black)
                        }
                    }.padding()
                    
                    Button(action: {
                        saveLanguage(l: "RU")
                    }){
                        ZStack{
                            Language()
                            Text("RU")
                                .foregroundColor(.black)
                        }
                    }.padding()
                    
                    
                    
                }
                if languageDB[0].language == "RU"{
                    Text("Список пользователей")
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .font(.system(size: 30))
                        .bold()
                        .padding()
                }
                else if languageDB[0].language == "EN"{
                    Text("List of users")
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .font(.system(size: 30))
                        .bold()
                        .padding()
                }
                else{
                    Text("Пайдаланушылар тізімі")
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .font(.system(size: 30))
                        .bold()
                        .padding()
                } //mainText end
                
                if !names.isEmpty{
                    ScrollView {
                        VStack {
                            ForEach (names, id: \.rating) { i in
                                NavigationLink(destination: UserProfileCuratorView(raiting: i.rating ?? 1, id: i.id ?? 0), label: {
                                    RatingPosition(name: "\(i.first_name ?? "") \(i.last_name ?? "")", JJCoins: (i.coins ?? 0), rating: (i.rating ?? 1))
                                })
                                
                            }
                        }// VStack - Scroll
                    }.cornerRadius(20)
                        .padding()
                }
                else{
                    if languageDB[0].language == "RU"{
                        Text("Пользователей пока нет...")
                            .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                            .font(.system(size: 20))
                            .padding()
                    }
                    else if languageDB[0].language == "EN"{
                        Text("There are no users yet...")
                            .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                            .font(.system(size: 20))
                            .padding()
                    }
                    else{
                        Text("Әзірге пайдаланушылар жоқ...")
                            .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                            .font(.system(size: 20))
                            .padding()
                    }
                    
                }
                    Spacer()
                    
                    HStack{
                        
                        IconsButtons(img: "home2")
                        NavigationLink {
                            CuratorProfileView()
                        } label: {
                            IconsButtons(img: "profile1")
                        }
                        
                        NavigationLink {
                            NewAppView()
                        } label: {
                            IconsButtons(img: "note1")
                        }
                        
                    }
                } //Vstack
            }.navigationBarBackButtonHidden()
                .task {
                    await sendRequestAllUsers()
                }//ZStack
        } //body
    
        func sendRequestAllUsers() async
        {
            let URL_ADDRESS: String = "http://34.22.215.91/api/v1/group/"
            guard let url = URL(string: URL_ADDRESS) else { return }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            print(tokensDB[0].access)
            request.setValue("Bearer \(tokensDB[0].access ?? "")", forHTTPHeaderField: "Authorization")
            
            msg = "Loading..."
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    msg = "Error"
                } else if let data = data {
                    sendDataProfile(data)
                    
                } else {
                    // Handle unexpected error
                    msg = "unexpected Error"
                }
            }
            task.resume()
            
            
        }
        
        func sendDataProfile(_ data: Data?) {
            if let data = data, let json = try? JSONSerialization.jsonObject(with: data) {
                print(json)
                let data1 = (try? JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)) ?? data
                let convertedString = String(data: data1, encoding: .utf8)
                var obj = try? JSONDecoder().decode(UserForList.self, from: data)
                print(obj?.objects)
                
                names = obj?.objects ?? []
                
            } else {
                print("=========> error")
            }
        }
        
        func saveLanguage(l: String) {
            languageDB[0].language = l
            try? moc.save()
        }
    } //struct

    
    struct UserListCuratorView_Previews: PreviewProvider {
        static var previews: some View {
            UserListCuratorView()
        }
    }

//{
//    group =     {
//        coins = 0;
//        "first_name" = uu111;
//        id = 37;
//        "last_name" = uu111;
//        username = uu111;
//    };
//}
//nil
//
//{
//    objects =     (
//                {
//            coins = 0;
//            "first_name" = bnbn;
//            id = 34;
//            "last_name" = bnbn;
//            rating = 1;
//            username = bnbn;
//        },
//                {
//            coins = 0;
//            "first_name" = ukjmyhnbgfedw;
//            id = 35;
//            "last_name" = ukjmyhnbgfedw;
//            rating = 2;
//            username = ukjmyhnbgfedw;
//        }
//    );
//    pagination =     {
//        count = 1;
//        next = "<null>";
//        previous = "<null>";
//    };
//}
