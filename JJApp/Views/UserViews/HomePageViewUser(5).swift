//
//  HomePageView.swift
//  JJApp
//
//  Created by ITSTEP on 24.02.2023.
//
//Заменить JJCoins, RatingAmount на NavigationLink!!!!!

import SwiftUI

struct HomePageViewUser: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var tokensDB: FetchedResults<TokensDB>
    
    
    @State var ratingList: [UserInfoList] = []
    @State var JJcoins: Int = -1
    @State var myRating: Int = -1
    var body: some View {
        
        ZStack {
            Background()
            TabCircle()
              
            //Elements
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
                    }.padding(.horizontal)
                    
                    Button(action: {
                        saveLanguage(l: "EN")
                        
                    }){
                        ZStack{
                            Language()
                            Text("EN")
                                .foregroundColor(.black)
                        }
                    }.padding(.horizontal)
                    
                    Button(action: {
                        saveLanguage(l: "RU")
                        
                    }){
                        ZStack{
                            Language()
                            Text("RU")
                                .foregroundColor(.black)
                        }
                    }.padding(.horizontal)
                    
                    
                
                }
                
                
                HomeLogo()
                
                
                ZStack {
                    JJCoins()
                    Text("\(JJcoins)")
                        .font(.system(size: 45))
                        .bold()
                        .foregroundColor(Color(red: 0.074, green: 0.414, blue: 0.23))
                        .offset(x: 90)
                }
                
                
                NavigationLink {
                    RatingView()
                } label: {
                    ZStack{
                        RatingAmount()
                        Text("\(myRating)")
                            .font(.system(size: 45))
                            .bold()
                            .foregroundColor(Color(red: 0.074, green: 0.414, blue: 0.23))
                            .offset(x: 90)
                    }
                }
                
                Group{
                    Spacer()
                    Spacer()
                    Spacer()
                }
                //кнопка отправить отчет
                NavigationLink {
                    SendReportView()
                } label: {
                    SendReportButton()
                }
                
                NavigationLink {
                    AllUsersAppsView_19_()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.white)
                            .frame(width: 300, height: 40)
                            .shadow(radius: 10)
                        if languageDB[0].language == "RU" {
                            Text("Просмотреть все отчеты")
                                .tracking(1)
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                        } else if languageDB[0].language == "EN" {
                            Text("View all reports")
                                .tracking(1)
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                        } else {
                            Text("Барлық есептерді қарау")
                                .tracking(1)
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                        }
                    }
                }
                
                    
            
                Spacer()
                
                HStack{
                    IconsButtons(img: "home2")
                    
                    NavigationLink {
                        MyProfileView()
                    } label: {
                        IconsButtons(img: "profile1")
                    }
                    NavigationLink {
                        NoteView()
                    } label: {
                        IconsButtons(img: "note1")
                    }
                }.padding()
            }
        
        }.navigationBarBackButtonHidden()
            .task {
                await sendRequestAllUsers()
            }
    }

    func sendRequestAllUsers() async
    {
        //        var responseData = [
        //            "username": login,
        //            "password": password
        //        ]
        
        //var sendingData = try! JSONEncoder().encode(responseData)
        let URL_ADDRESS: String = "http://34.22.215.91/api/v1/group/"
        guard let url = URL(string: URL_ADDRESS) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print(tokensDB[0].access)
        request.setValue("Bearer \(tokensDB[0].access ?? "")", forHTTPHeaderField: "Authorization")
        
        //request.httpBody = sendingData
        //msg = "Loading..."
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                //msg = "Error"
            } else if let data = data {
                sendDataProfileRating(data)
                
            } else {
                // Handle unexpected error
                //msg = "unexpected Error"
            }
        }
        task.resume()
        
        
    }
    
    func sendDataProfileRating(_ data: Data?) {
        if let data = data, let json = try? JSONSerialization.jsonObject(with: data) {
            //print(json)
            let data1 = (try? JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)) ?? data
            //let convertedString = String(data: data1, encoding: .utf8)
            let obj = try? JSONDecoder().decode(UserForList.self, from: data)
            print(obj?.objects ?? "")
            
            ratingList = obj?.objects ?? []
            
            for i in ratingList{
                if i.username == tokensDB[0].username{
                    myRating = i.rating ?? -1
                    JJcoins = i.coins ?? -1
                    print(myRating)
                }
            }
            
        } else {
            print("=========> error")
        }
    }
    
    func saveLanguage(l: String) {
        languageDB[0].language = l
        try? moc.save()
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageViewUser()
    }
}
