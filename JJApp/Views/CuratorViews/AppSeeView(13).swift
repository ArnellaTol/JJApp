//
//  AppSeeView.swift
//  JJApp
//
//  Created by Arnella Tolegen on 29.04.2023.
//

import SwiftUI

struct AppSeeView: View {
    @Environment (\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @FetchRequest(sortDescriptors: []) var tokensDB: FetchedResults<TokensDB>
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    
    @State var report: ReportsCheck
    @State var imageData: Data = Data()
    
    var statusRU: [String] = ["Поливка дерева", "Разрыхление дерева", "Побелка дерева", "Удобрение дерева"]
    var statusEN: [String] = ["Watering the tree", "Loosening the tree", "Whitewashing the tree", "Fertilizing the tree"]
    var statusKZ: [String] = ["Ағашты суару", "Ағашты қопсыту", "Ағашты ағарту", "Ағашты ұрықтандыру"]
    
    @State var approve: String = ""
    
    var body: some View {
        VStack{
            HStack{
                
                Spacer()
                    .toolbar(content: {
                        ToolbarItem(placement: .navigationBarLeading, content: {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss ()
                            }, label: {Back()})
                        })
                    })
                
                
                if languageDB[0].language == "RU"{
                    Text("Просмотр заявки")
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .font(.system(size: 30))
                        .bold()
                        .padding(.vertical)
                    
                }
                else if languageDB[0].language == "EN"{
                    Text("Viewing the request")
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .font(.system(size: 30))
                        .bold()
                        .padding(.vertical)
                }
                else{
                    Text("Өтінішті қарау")
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .font(.system(size: 30))
                        .bold()
                    .padding(.vertical)                }
                Spacer()
            }
            Spacer()
            VStack(alignment: .leading){
                HStack {
                    if languageDB[0].language == "RU"{
                        Text("Имя пользователя:")
                            .bold()
                            .modifier(TextTitleGreen())
                    }
                    else if languageDB[0].language == "EN" {
                        Text("User's name:")
                            .bold()
                            .modifier(TextTitleGreen())
                    } else {
                        Text("Пайдаланушы аты:")
                            .bold()
                            .modifier(TextTitleGreen())
                    }
                    Text(report.user)
                        .font(.system(size: 21))
                } .padding(.vertical, 2)
                
                VStack(alignment: .leading) {
                    if languageDB[0].language == "RU"{
                        Text("Действия:")
                            .bold()
                            .modifier(TextTitleGreen())
                        Text(statusRU[report.report-1])
                            .font(.system(size: 21))
                    }
                    else if languageDB[0].language == "EN" {
                        Text("Actions:")
                            .bold()
                            .modifier(TextTitleGreen())
                        Text(statusEN[report.report-1])
                            .font(.system(size: 21))
                    } else {
                        Text("Әрекеттер:")
                            .bold()
                            .modifier(TextTitleGreen())
                        Text(statusKZ[report.report-1])
                            .font(.system(size: 21))
                    }
                    
                } .padding(.vertical, 2)
                
                HStack {
                    Text("JJcoins:")
                        .bold()
                        .modifier(TextTitleGreen())
                    
                    Text(String(report.report*10))
                        .font(.system(size: 21))
                } .padding(.vertical, 2)
            }
            Spacer()
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                    .frame(width: 300, height: 300)
                    .shadow(radius: 10)
                
                Image("loading")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 298, height: 298)
                    .cornerRadius(20)
                
                Image(uiImage: imageData.image ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 298, height: 298)
                    .cornerRadius(20)
            }
            Spacer()
            
            HStack {
                Button(action: {
                    approve = "reject"
                    sendPatchRequest() { result in
                        switch result {
                        case .success(let responseString):
                            print("Request successful. Response: \(responseString)")
                            // Обработка успешного ответа от сервера
                        case .failure(let error):
                            print("Error sending PATCH request: \(error.localizedDescription)")
                            // Обработка ошибки запроса
                        }
                    }
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 7)
                            .fill(.red)
                            .frame(width: 152, height: 42)
                            .shadow(radius: 2, y: 3)
                        RoundedRectangle(cornerRadius: 7)
                            .fill(.white)
                            .frame(width: 150, height: 40)
                        if languageDB[0].language == "RU"{
                            Text("Отклонить")
                                .foregroundColor(.red)
                        }
                        else if languageDB[0].language == "EN"{
                            Text("Reject")
                                .foregroundColor(.red)
                        }
                        else{
                            Text("Бас тарту")
                                .foregroundColor(.red)
                        }
                        
                    }
                })
                
                Button(action: {
                    approve = "approved"
                    sendPatchRequest() { result in
                        switch result {
                        case .success(let responseString):
                            print("Request successful. Response: \(responseString)")
                            // Обработка успешного ответа от сервера
                        case .failure(let error):
                            print("Error sending PATCH request: \(error.localizedDescription)")
                            // Обработка ошибки запроса
                        }
                    }
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 7)
                            .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282))
                            .frame(width: 152, height: 42)
                            .shadow(radius: 2, y: 3)
                        if languageDB[0].language == "RU"{
                            Text("Принять")
                                .foregroundColor(.white)
                        }
                        else if languageDB[0].language == "EN"{
                            Text("Accept")
                                .foregroundColor(.white)
                        }
                        else{
                            Text("Қабылдау")
                                .foregroundColor(.white)
                        }
                        
                    }
                })
            }
            Spacer()
        }.navigationBarBackButtonHidden()
            .task {
                await getPhotoData()
            }
    }
    
    
    func getPhotoData() async {
        report.loadPhotoData { imageData in
            if let imageData = imageData {
                self.imageData = imageData
                // Используйте imageData для отображения изображения или выполнения других операций с ним
            } else {
                print("error load image")
                // Обработайте случай, если данные изображения не были загружены
            }
        }
    }

    
    func sendPatchRequest(completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "http://34.22.215.91/api/v1/check-report/\(report.id)/") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"

        let requestBody = ["action": approve]
        if let httpBody = try? JSONSerialization.data(withJSONObject: requestBody) {
            request.httpBody = httpBody
        } else {
            completion(.failure(NSError(domain: "JSON Serialization Error", code: -1, userInfo: nil)))
            return
        }

        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(tokensDB[0].access ?? "")", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data, let httpResponse = response as? HTTPURLResponse {
                if (200..<300).contains(httpResponse.statusCode) {
                    if let resultString = String(data: data, encoding: .utf8) {
                        completion(.success(resultString))
                    } else {
                        completion(.failure(NSError(domain: "Response Data Decoding Error", code: -1, userInfo: nil)))
                    }
                } else {
                    completion(.failure(NSError(domain: "HTTP Error", code: httpResponse.statusCode, userInfo: nil)))
                }
            } else {
                completion(.failure(NSError(domain: "Invalid Response", code: -1, userInfo: nil)))
            }
        }

        task.resume()
    }
    
}

struct AppSeeView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppSeeView(report: ReportsCheck(approved: false, date_upload: "", id: 0, photo: "", report: 0, title: "", user: ""), imageData: Data())
    }
}
