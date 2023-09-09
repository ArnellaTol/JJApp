//
//  NewAppView(12).swift
//  JJApp
//
//  Created by ITSTEP on 18.04.2023.
//

import SwiftUI
struct TextMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.green)
            .font(.system(size: 40))
            
        
    }
}

struct NewAppView: View {
    //var newApp: [String] = ["arnella", "gleb", "evgeniy", "hello", "goodbye"]
    @FetchRequest(sortDescriptors: []) var tokensDB: FetchedResults<TokensDB>
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    
    //@State var msg = ""
    @State var allReports: [ReportsCheck] = []
    @State var imagesData: [Data] = []
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea(.all)
            TabCircle()
            VStack {
                
                if languageDB[0].language == "RU"{
                    Text("Ваши заявки")
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .font(.system(size: 40))
                        .bold()
                        .padding()
                }
                else if languageDB[0].language == "EN"{
                    Text("Your requests")
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .font(.system(size: 40))
                        .bold()
                        .padding()
                }
                else{
                    Text("Сіздің өтініштеріңіз")
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .font(.system(size: 40))
                        .bold()
                        .padding()
                }
                
                
                ScrollView {
                    VStack {
                        ForEach (0..<allReports.count, id: \.self) { i in
                            if allReports[i].approved == nil {
                                NavigationLink(destination: AppSeeView(report: allReports[i]), label: {AppForUser(title: allReports[i].user)})
                            }
                        }
                    }
                }
                .frame(height: 400)
                .cornerRadius(10)
                Spacer()
                
                HStack{
                    NavigationLink {
                        //change to ListView
                        UserListCuratorView()
                    } label: {
                        IconsButtons(img: "home1")
                    }
                    NavigationLink {
                        CuratorProfileView()
                    } label: {
                        IconsButtons(img: "profile1")
                    }
                    
                    IconsButtons(img: "note2")
                    
                }
            }
        }.navigationBarBackButtonHidden()
            .task {
                await sendRequestAllReports()
            }
    }
    
    func sendRequestAllReports() async
    {
        let URL_ADDRESS: String = "http://34.22.215.91/api/v1/check-report/"
        guard let url = URL(string: URL_ADDRESS) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        print(tokensDB[0].access)
        request.setValue("Bearer \(tokensDB[0].access ?? "")", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
            } else if let data = data {
                sendDataAllReports(data)
                
            } else {
                // Handle unexpected error
            }
        }
        task.resume()
    }
    
    func sendDataAllReports(_ data: Data?) {
        if let data = data, let json = try? JSONSerialization.jsonObject(with: data) {
            print(json)
            let data1 = (try? JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)) ?? data
            let convertedString = String(data: data1, encoding: .utf8)
            var obj = try? JSONDecoder().decode(ReportsListCheck.self, from: data)
            allReports = obj?.objects ?? [ReportsCheck(approved: nil, date_upload: "", id: 0, photo: "", report: 0, title: "", user: "")]
          
        }
        else {
            print("=========> error")
        }
    }
}

struct NewAppView_Previews: PreviewProvider {
    static var previews: some View {
        NewAppView()
    }
}
