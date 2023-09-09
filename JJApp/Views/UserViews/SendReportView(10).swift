//
//  SendReportView.swift
//  JJApp
//
//  Created by Arnella Tolegen on 02.04.2023.
//

import SwiftUI

struct TextFieldGreen2: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .padding()
            .frame(width: 320)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .tint(Color(red: 0.062, green: 0.414, blue: 0.23))
    }
}

struct SendReportView: View {
    @Environment (\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @FetchRequest(sortDescriptors: []) var tokensDB: FetchedResults<TokensDB>
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    
    @State var reportText: String = ""
    @State private var showSheet = false
    @State var imageReport: UIImage = UIImage()
    
    var statusRU: [String] = ["Поливка дерева", "Разрыхление дерева", "Побелка дерева", "Удобрение дерева"]
    var statusEN: [String] = ["Watering the tree", "Loosening the tree", "Whitewashing the tree", "Fertilizing the tree"]
    var statusKZ: [String] = ["Ағашты суару", "Ағашты қопсыту", "Ағашты ағарту", "Ағашты ұрықтандыру"]
    @State var indexStatus: Int = 0
    
    @State var isSuccess: Bool = false
    @State var isWait: Bool = false
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea(.all)
            
            
            
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
                        Text("Напишите отчет:")
                            .bold()
                            .modifier(TextTitleGreen())
                    }
                    else if languageDB[0].language == "EN"{
                        Text("Write a report:")
                            .bold()
                            .modifier(TextTitleGreen())
                    }
                    else{
                        Text("Есеп жазу:")
                            .bold()
                            .modifier(TextTitleGreen())
                    }
                    Spacer()
                }
                
                ZStack{
                    ActionPicker()
                    HStack{
                        Menu(content: {
                            Picker("", selection: $indexStatus, content: {
                                ForEach(0..<statusRU.count){ i in
                                    if languageDB[0].language == "RU"{
                                        Text(statusRU[i])
                                    }else if languageDB[0].language == "EN"{
                                        Text(statusEN[i])
                                    }else{
                                        Text(statusKZ[i])
                                    }
                                    
                                }
                            })
                        }, label: {
                            if languageDB[0].language == "RU"{
                                Text(statusRU[indexStatus])
                            }
                            else if languageDB[0].language == "EN"{
                                Text(statusEN[indexStatus])
                            }
                            else{
                                Text(statusKZ[indexStatus])
                            }
                            Image(systemName: "chevron.up.chevron.down")
                        })
                        .frame(width: 280, height: 40)
                        .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282))
                    }
                    .padding()
                    .frame(width: 300, height: 40)
                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: .leading, endPoint: .trailing))
                        .frame(width: 300, height: 60)
                        .shadow(radius: 2)
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .frame(width: 298, height: 58)
                    VStack{
                        if languageDB[0].language == "RU"{
                            TextField("Опишите ваши действия...", text: $reportText)
                                .modifier(TextFieldGreen2())
                        }
                        else if languageDB[0].language == "EN"{
                            TextField("Describe your actions...", text: $reportText)
                                .modifier(TextFieldGreen2())
                        }
                        else{
                            TextField("Сіздің әрекеттеріңізді сипаттаңыз...", text: $reportText)
                                .modifier(TextFieldGreen2())
                        }
                        
                        Spacer()
                    }
                }.frame(width: 320, height: 60)
                
                Button(action: {
                    showSheet.toggle()
                }, label: {
                    HStack{
                        if languageDB[0].language == "RU"{
                            Text("Прикрепить фотоотчет").foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282)).font(.title3)
                        }
                        else if languageDB[0].language == "EN"{
                            Text("Attach a photo report").foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282)).font(.title3)
                        }
                        else{
                            Text("Фото есепті тіркеу").foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282)).font(.title3)
                        }
                        Image(systemName: "photo").foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282)).font(.title3)
                    }.padding()
                }).sheet(isPresented: $showSheet) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $imageReport)
                }
                
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .frame(width: 300, height: 300)
                        .shadow(radius: 10)
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .frame(width: 298, height: 298)
                        .shadow(radius: 10)
                    Image("NoProfileFoto")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 298, height: 298)
                        .cornerRadius(20)
                    Image(uiImage: imageReport)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 298, height: 298)
                        .cornerRadius(20)
                }
                
                if isSuccess{
                    if languageDB[0].language == "RU"{
                        Text("Отчет успешно отправлен")
                            .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282)).font(.title3)
                    }
                    else if languageDB[0].language == "EN"{
                        Text("Report successfully sent")
                            .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282)).font(.title3)
                    }
                    else{
                        Text("Есеп сәтті жіберілді")
                            .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282)).font(.title3)
                    }
                }
                else if isWait{
                    if languageDB[0].language == "RU"{
                        Text("Загрузка...")
                            .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282)).font(.title3)
                    }
                    else if languageDB[0].language == "EN"{
                        Text("Loading...")
                            .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282)).font(.title3)
                    }
                    else{
                        Text("Жүктеу...")
                            .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282)).font(.title3)
                    }
                }
                else{
                    Text(" ")
                        .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282)).font(.title3)
                }
                
                Button(action: {
                    //send report
                    sendRequestReport()
                }, label: {
                    ZStack{
                        GreenButtonLightDark()
                        
                        if languageDB[0].language == "RU"{
                            Text("Отправить").foregroundColor(.white).font(.title3)
                        }
                        else if languageDB[0].language == "EN"{
                            Text("Send").foregroundColor(.white).font(.title3)
                        }
                        else{
                            Text("Жіберу").foregroundColor(.white).font(.title3)
                        }
                        
                    }.padding()
                })
            }
        } .navigationBarBackButtonHidden()
    }
    

    func sendRequestReport() {
        isWait = true
        guard let imageData = imageReport.jpegData(compressionQuality: 0.1) else {
            print("Error obtaining image data.")
            return
        }

        let URL_ADDRESS = "http://34.22.215.91/api/v1/student-report/"
        guard let url = URL(string: URL_ADDRESS) else {
            print("Invalid URL.")
            return
        }

        let headers: [String: String] = ["Authorization": "Bearer \(tokensDB[0].access ?? "")"]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers

        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var data = Data()
        data.append("--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"title\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(reportText)\r\n".data(using: .utf8)!)

        data.append("--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"report\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(indexStatus + 1)\r\n".data(using: .utf8)!)

        data.append("--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"photo\"; filename=\"photo.jpg\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        data.append(imageData)
        data.append("\r\n".data(using: .utf8)!)

        data.append("--\(boundary)--\r\n".data(using: .utf8)!)

        let task = URLSession.shared.uploadTask(with: request, from: data) { (data, response, error) in
            if let error = error {
                print("Error sending request: \(error)")
            } else if let data = data {
                sendDataReport(data)
            } else {
                print("Unexpected error: No data received.")
            }
        }
        task.resume()
    }

    func sendDataReport(_ data: Data?) {
        if let data = data {
            print("Received data from server:")
            print(String(data: data, encoding: .utf8) ?? "Unable to convert data to string")

            do {
                let decoder = JSONDecoder()
                let obj = try decoder.decode(ResponseDataSuccess.self, from: data)
                print(obj.success?.message ?? "")
                if obj.success?.message == "report created"{
                    isWait = false
                    isSuccess = true
                }
            } catch {
                print("Error decoding response: \(error)")
            }
        } else {
            print("Error: No data received.")
        }
    }

}

struct SendReportView_Previews: PreviewProvider {
    static var previews: some View {
        SendReportView()
    }
}


