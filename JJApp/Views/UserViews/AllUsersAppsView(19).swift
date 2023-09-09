//
//  AllUsersAppsView(19).swift
//  JJApp
//
//  Created by Arnella Tolegen on 13.06.2023.
//

import SwiftUI

struct AllUsersAppsView_19_: View {
    @Environment (\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @State var allReports: [ObjectReportInList] = []
    @FetchRequest(sortDescriptors: []) var tokensDB: FetchedResults<TokensDB>
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea(.all)
            
            VStack(alignment: .center) {
                HStack(){
                    Spacer()
                        .toolbar(content: {
                            ToolbarItem(placement: .navigationBarLeading, content: {
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss ()
                                }, label: {Back()})
                            })
                        })
                    
                    if languageDB[0].language == "RU"{
                        Text("Ваши отчеты")
                            .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                            .font(.system(size: 30))
                            .bold()
                            .padding()
                    }
                    else if languageDB[0].language == "EN"{
                        Text("Your reports")
                            .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                            .font(.system(size: 30))
                            .bold()
                            .padding()
                    }
                    else{
                        Text("Сіздің eсептеріңіз")
                            .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                            .font(.system(size: 28))
                            .bold()
                            .padding()
                    }
                    Spacer()
                }
                VStack(alignment: .leading){
                    if languageDB[0].language == "RU"{
                        Text("На проверке")
                            .foregroundColor(Color(red: 0.9, green: 0.7, blue: 0))
                            .font(.system(size: 24))
                            .bold()
                            .padding()
                    }
                    else if languageDB[0].language == "EN"{
                        Text("Оn verification")
                            .foregroundColor(Color(red: 0.9, green: 0.7, blue: 0))
                            .font(.system(size: 24))
                            .bold()
                            .padding()
                    }
                    else{
                        Text("Тексеруде")
                            .foregroundColor(Color(red: 0.9, green: 0.7, blue: 0))
                            .font(.system(size: 24))
                            .bold()
                            .padding()
                    }
                    VStack(alignment: .center){
                        ScrollView {
                            ForEach (0..<allReports.count, id: \.self) { i in
                                if allReports[i].approved == nil{
                                    NavigationLink(destination: MyReportView_20_(reportFromList: allReports[i]), label: {
                                        AppForUser(title: allReports[i].title)
                                    })
                                }
                            }
                        }
                    }
                    if languageDB[0].language == "RU"{
                        Text("Принято")
                            .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                            .font(.system(size: 24))
                            .bold()
                            .padding()
                    }
                    else if languageDB[0].language == "EN"{
                        Text("Accepted")
                            .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                            .font(.system(size: 24))
                            .bold()
                            .padding()
                    }
                    else{
                        Text("Қабылданды")
                            .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                            .font(.system(size: 24))
                            .bold()
                            .padding()
                    }
                    VStack(alignment: .center){
                        ScrollView {
                            ForEach (0..<allReports.count, id: \.self) { i in
                                if allReports[i].approved == true {
                                    NavigationLink(destination: MyReportView_20_(reportFromList: allReports[i]), label: {
                                        AppForUser(title: allReports[i].title)
                                    })
                                }
                            }
                        }
                    }
                    if languageDB[0].language == "RU"{
                        Text("Отклонено")
                            .foregroundColor(.red)
                            .font(.system(size: 24))
                            .bold()
                            .padding()
                    }
                    else if languageDB[0].language == "EN"{
                        Text("Rejected")
                            .foregroundColor(.red)
                            .font(.system(size: 24))
                            .bold()
                            .padding()
                    }
                    else{
                        Text("Қабылданбады")
                            .foregroundColor(.red)
                            .font(.system(size: 24))
                            .bold()
                            .padding()
                    }
                    VStack(alignment: .center){
                        ScrollView {
                            ForEach (0..<allReports.count, id: \.self) { i in
                                if allReports[i].approved == false {
                                    NavigationLink(destination: MyReportView_20_(reportFromList: allReports[i]), label: {
                                        AppForUser(title: allReports[i].title)
                                    })
                                }
                            }
                        }
                    }
                }
                .cornerRadius(10)
                Spacer()
            }
        }.navigationBarBackButtonHidden()
            .task {
                await sendRequestAllReports()
            }
    }
    
    func sendRequestAllReports() async
    {
        let URL_ADDRESS: String = "http://34.22.215.91/api/v1/student-report/"
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
            var obj = try? JSONDecoder().decode(AllReportsData.self, from: data)
            allReports = obj?.objects ?? []
        } else {
            print("=========> error")
        }
    }
    
}

struct AllUsersAppsView_19__Previews: PreviewProvider {
    static var previews: some View {
        AllUsersAppsView_19_()
    }
}
