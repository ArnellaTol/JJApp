//
//  RatingView(11).swift
//  JJApp
//
//  Created by ITSTEP on 04.04.2023.
//

import SwiftUI

struct RatingView: View {
    @Environment (\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @FetchRequest(sortDescriptors: []) var tokensDB: FetchedResults<TokensDB>
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    
    @State var msg = ""
    
    @State var names: [UserInfoList] = []
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea(.all)
            
            TabCircle()
            
//----------------------------------------
            
            VStack {
                Image("RatingPNG")
                    .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .offset(x: 0, y: -20)
                Spacer()
                    
            }.ignoresSafeArea(.all)
            
            
            Spacer()
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss ()
                        }, label: {Back()})
                    })
                })
            
//-----------------------------------------
            VStack {
                Spacer().frame(height: 200)
                
                HStack {
                    ForEach (0..<5) {img in
                        Image("RatingStar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25)
                            .shadow(radius: 1, y: 1)
                    }//Cycle
                }//Hstack
                if languageDB[0].language == "RU"{
                    Text("Рейтинг")
                        .foregroundColor(Color(red: 0.074, green: 0.414, blue: 0.23))
                        .bold()
                        .font(.system(size: 25))
                        
                }
                else if languageDB[0].language == "EN"{
                    Text("Rating")
                        .foregroundColor(Color(red: 0.074, green: 0.414, blue: 0.23))
                        .bold()
                        .font(.system(size: 25))
                    
                }
                else{
                    Text("Рейтинг")
                        .foregroundColor(Color(red: 0.074, green: 0.414, blue: 0.23))
                        .bold()
                        .font(.system(size: 25))
                }
                
                ScrollView {
                    VStack {
                        ForEach(names, id: \.rating) { i in
                            RatingPosition(name: "\(i.first_name ?? "") \(i.last_name ?? "")", JJCoins: (i.coins ?? 0), rating: (i.rating ?? 1))
                        }
                    }.frame(width: 300)
                }
                .cornerRadius(20)
                .frame(width: 300)
                .padding()
            }//Vstack
        }//ZStack
        .navigationBarBackButtonHidden()
        .task {
            await sendRequestAllUsers()
        }//ZStack
} //body
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
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
    }
}
