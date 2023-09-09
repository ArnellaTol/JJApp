//
//  ProfileSettingsView(9).swift
//  JJApp
//
//  Created by Arnella Tolegen on 01.04.2023.
//

import SwiftUI

struct ProfileSettingsView: View {
    @Environment (\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @FetchRequest(sortDescriptors: []) var tokensDB: FetchedResults<TokensDB>
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    
    var statusRU: [String] = ["Студент", "Преподаватель", "Другое"]
    var statusEN: [String] = ["Student", "Teacher", "Other"]
    var statusKZ: [String] = ["Студент", "Оқытушы", "Басқа"]
    @State var indexStatus: Int = 0
    
    @State var name: String
    @State var surname: String
    @State var username: String
    @State var phoneNumber: String
    @State var email: String
    @State var imageUser: UIImage
    
    @State private var showSheet = false
    
    @State var isSuccess: Bool = false
    @State var isWait: Bool = false
    
    @State private var confirmationShown = false
    @State var isDelete: Bool = false
    @State var areyousure: [String] = ["","",""]
   
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea(.all)
            
            
            VStack{
                Spacer()
                    .toolbar(content: {
                        ToolbarItem(placement: .navigationBarLeading, content: {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss ()
                            }, label: {Back()})
                        })
                    })
                if languageDB[0].language == "RU"{
                    Text("Редактирование профиля")
                        .bold()
                        .modifier(TextTitleGreen())
                    
                    
                }
                else if languageDB[0].language == "EN"{
                    Text("Editing a profile")
                        .bold()
                        .modifier(TextTitleGreen())
                }
                else{
                    Text("Профильді өңдеу")
                        .bold()
                        .modifier(TextTitleGreen())
                }
                
                Button(action: {
                    showSheet.toggle()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: .leading, endPoint: .trailing))
                            .frame(width: 300, height: 100)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .frame(width: 298, height: 97.5)
                        HStack {
                            ZStack{
                                Circle()
                                    .frame(width: 75)
                                    .foregroundColor(Color(red: 0.366, green: 0.598, blue: 0.269))
                                    .shadow(radius: 2)
                                
                                Circle()
                                    .frame(width: 73)
                                    .foregroundColor(Color(red: 0.925, green: 0.925, blue: 0.925))
                                
                                
                                Image("NoProfileFoto")
                                    .resizable()
                                    .frame(width: 68, height: 68)
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(68)
                                Image(uiImage: imageUser)
                                    .resizable()
                                    .frame(width: 68, height: 68)
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(68)
                                    
                            }
                            
                            if languageDB[0].language == "RU"{
                                Text("Изменить фото \nпрофиля")
                                    .foregroundColor(Color(red: 0.473, green: 0.58, blue: 0.478))
                                    .multilineTextAlignment(.leading)
                                    .padding(.trailing, 50)
                                    .padding(.leading, 10)
                                
                                
                            }
                            else if languageDB[0].language == "EN"{
                                Text("Change your \nprofile photo")
                                    .foregroundColor(Color(red: 0.473, green: 0.58, blue: 0.478))
                                    .multilineTextAlignment(.leading)
                                    .padding(.trailing, 70)
                                    .padding(.leading, 10)
                            }
                            else{
                                Text("Профиль \nфото өзгерту")
                                    .foregroundColor(Color(red: 0.473, green: 0.58, blue: 0.478))
                                    .multilineTextAlignment(.leading)
                                    .padding(.trailing, 60)
                                    .padding(.leading, 10)
                            }
                        } //Hstack
                    } //ZStack
                })
                .sheet(isPresented: $showSheet) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $imageUser)
                }
                
                Group{
                    TextFieldView(variable: $name, fieldTextRU: "Имя", fieldTextEN: "Name", fieldTextKZ: "Аты", textLimit: 100)
                    
                    TextFieldView(variable: $surname, fieldTextRU: "Фамилия", fieldTextEN: "Surname", fieldTextKZ: "Тегі", textLimit: 100)
                    
                    TextFieldView(variable: $username, fieldTextRU: "Логин", fieldTextEN: "Username", fieldTextKZ: "Логин", textLimit: 100)
                    
                    TextFieldView(variable: $phoneNumber, fieldTextRU: "Контактный номер", fieldTextEN: "Phone number", fieldTextKZ: "Байланыс нөмірі", textLimit: 12)
                    
                    TextFieldView(variable: $email, fieldTextRU: "Почта", fieldTextEN: "Email", fieldTextKZ: "Пошта", textLimit: 100)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                            .frame(width: 300, height: 40)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .frame(width: 298, height: 38)
                        HStack{
                            if languageDB[0].language == "RU"{
                                Text("Статус")
                                    .foregroundColor(Color(red: 0.773, green: 0.773, blue: 0.781, opacity: 1.0))
                            }else if languageDB[0].language == "EN"{
                                Text("Status")
                                    .foregroundColor(Color(red: 0.773, green: 0.773, blue: 0.781, opacity: 1.0))
                            }else{
                                Text("Мәртебесі")
                                    .foregroundColor(Color(red: 0.773, green: 0.773, blue: 0.781, opacity: 1.0))
                            }
                            
                            Spacer()
                            
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
                            .frame(width: 176, height: 40)
                            .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282))
                        }
                        .padding()
                        .frame(width: 300, height: 40)
                        
                    }
                    
                    if isSuccess{
                        if languageDB[0].language == "RU"{
                            Text("Профиль успешно обновлён")
                                .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282)).font(.title3)
                        }
                        else if languageDB[0].language == "EN"{
                            Text("Profile successfully updated")
                                .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282)).font(.title3)
                        }
                        else{
                            Text("Профиль сәтті жаңартылды")
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
                    ZStack{
                        Button(action: {
                            sendPatchRequestProfileInfo()
                            
                        }, label: {
                            ZStack{
                                GreenButtonLightDark()
                                
                                if languageDB[0].language == "RU"{
                                    Text("Сохранить").foregroundColor(Color.white).font(.title3)
                                }
                                else if languageDB[0].language == "EN"{
                                    Text("Save").foregroundColor(Color.white).font(.title3)
                                }
                                else{
                                    Text("Сақтау").foregroundColor(Color.white).font(.title3)
                                }
                                
                            }.padding()
                        })
                        HStack{
                            Spacer()
                            Button(action: {
                                
                                confirmationShown = true
                                if languageDB[0].language == "RU"{
                                    areyousure = ["Вы уверены?","Да","Нет"]
                                }
                                else if languageDB[0].language == "EN" {
                                    areyousure = ["Are you sure?","Yes","No"]
                                } else {
                                    areyousure = ["Сіз сенімдісіз бе?","Иә","Жоқ"]
                                }
                                
                            }, label: {
                                ZStack{
                                    Image(systemName: "trash.fill")
                                        .foregroundColor(.red)
                                        .font(.title)
                                    
                                }.padding()
                            })
                        }
                        
                    }
                    Spacer()
                }
            }
        }.navigationBarBackButtonHidden()
        .alert(isPresented: $confirmationShown) {
            Alert(title:Text(areyousure[0]),
                message: nil,
                  primaryButton: .destructive(Text(areyousure[1]).foregroundColor(.red), action: {
                sendDeleteRequestProfileInfo()
                isDelete = true
                }),
                secondaryButton: .cancel(Text(areyousure[2]))
            )
        }
        .background(
            NavigationLink(
                destination: LogInView(),
                isActive: $isDelete,
                label: { EmptyView() }
            )
        )
        
    }
    
    func sendPatchRequestProfileInfo() {
        isWait = true
        let URL_ADDRESS = "http://34.22.215.91/api/v1/per-cab/"
        guard let url = URL(string: URL_ADDRESS) else {
            print("Invalid URL.")
            return
        }
        
        guard let imageData = imageUser.jpegData(compressionQuality: 0.1) else {
            print("Error obtaining image data.")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(tokensDB[0].access ?? "")", forHTTPHeaderField: "Authorization")

        var data = Data()

        data.append("--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"first_name\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(name)\r\n".data(using: .utf8)!)

        data.append("--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"last_name\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(surname)\r\n".data(using: .utf8)!)

        data.append("--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"username\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(username)\r\n".data(using: .utf8)!)

        data.append("--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"phone_number\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(phoneNumber)\r\n".data(using: .utf8)!)

        data.append("--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"email\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(email)\r\n".data(using: .utf8)!)

        data.append("--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"status\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(statusEN[indexStatus])\r\n".data(using: .utf8)!)
        
        data.append("--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"photo\"; filename=\"photo.jpg\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        data.append(imageData)
        data.append("\r\n".data(using: .utf8)!)

        data.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        
        let task = URLSession.shared.uploadTask(with: request, from: data) { (data, response, error) in
            if let error = error {
                print("Error sending PATCH request: \(error)")
            } else if let data = data {
                print(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Invalid data"
                            print(responseString)
                // Process the response data here
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                    print("Received data from server:")
                    print(json)
                    var obj = try? JSONDecoder().decode(ResponseDataSuccess.self, from: data)
                    if obj?.success?.message == "updated"{
                        isSuccess = true
                        isWait = false
                    }
                }
                else{
                    print("data not json")
                }
            } else {
                print("Unexpected error: No data received.")
            }
        }
        task.resume()
    }

    
    func sendDeleteRequestProfileInfo() {
        let URL_ADDRESS: String = "http://34.22.215.91/api/v1/per-cab/"
        guard let url = URL(string: URL_ADDRESS) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        print(tokensDB[0].access)
        request.setValue("Bearer \(tokensDB[0].access ?? "")", forHTTPHeaderField: "Authorization")
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                // Handle response data if needed
                print("DELETE request success")
            } else {
                // Handle unexpected error
                print("Error unexpected")
            }
        }
        task.resume()
    }

}

struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView(indexStatus: 0, name: "", surname: "", username: "", phoneNumber: "", email: "", imageUser: UIImage())
    }
}
