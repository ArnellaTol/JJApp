//
//  ProfSettingsCurator.swift
//  JJApp
//
//  Created by ITSTEP on 13.05.2023.
//

import SwiftUI

struct TextTitleGreenCurator: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(red: 0.074, green: 0.414, blue: 0.23))
            .font(.system(size: 24))
//            .padding(.vertical, 50)  На старых айфонах плохо выглядит, так что не нада :)
            
    }
}

struct ProfSettingsCurator: View {
    @Environment (\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @FetchRequest(sortDescriptors: []) var tokensDB: FetchedResults<TokensDB>
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    
    @State var name: String
    @State var surname: String
    @State var username: String
    @State var phoneNumber: String
    @State var cardNumber: String //
    @State var email: String
    @State private var showSheet = false
    @State var imageCurator: UIImage
    
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
                        .modifier(TextTitleGreenCurator())
                        .padding()
                        
                }
                else if languageDB[0].language == "EN"{
                    Text("Editing a profile")
                        .bold()
                        .modifier(TextTitleGreenCurator())
                        .padding()
                }
                else{
                    Text("Профильді өңдеу")
                        .bold()
                        .modifier(TextTitleGreenCurator())
                        .padding()
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
                                
                                Image(uiImage: imageCurator)
                                    .resizable()
                                    .frame(width: 68, height: 68)
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(Circle())
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
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $imageCurator)
                }
                
                
                Group{
                    TextFieldView(variable: $name, fieldTextRU: "Имя", fieldTextEN: "Name", fieldTextKZ: "Аты", textLimit: 100)
                    
                    TextFieldView(variable: $surname, fieldTextRU: "Фамилия", fieldTextEN: "Surname", fieldTextKZ: "Тегі", textLimit: 100)
                    
                    TextFieldView(variable: $username, fieldTextRU: "Логин", fieldTextEN: "Login", fieldTextKZ: "Логин", textLimit: 100)
                    
                    //TextFieldView(variable: $password, fieldTextRU: "Пароль", fieldTextEN: "Password", fieldTextKZ: "Құпия сөз", textLimit: 100)
                    
                    TextFieldView(variable: $phoneNumber, fieldTextRU: "Контактный номер", fieldTextEN: "Phone number", fieldTextKZ: "Байланыс нөмірі", textLimit: 12)
                    
                    TextFieldView(variable: $cardNumber, fieldTextRU: "Номер карты", fieldTextEN: "Card number", fieldTextKZ: "Карта нөмірі", textLimit: 16)
                    
                    TextFieldView(variable: $email, fieldTextRU: "Почта", fieldTextEN: "Email", fieldTextKZ: "Пошта", textLimit: 100)
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
                    }) // Button
                    
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
            } //VStack2
        }.navigationBarBackButtonHidden()//ZStack
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
    } //body
    
    func sendPatchRequestProfileInfo() {
        isWait = true
        let URL_ADDRESS = "http://34.22.215.91/api/v1/per-cab/"
        guard let url = URL(string: URL_ADDRESS) else {
            print("Invalid URL.")
            return
        }
        
        guard let imageData = imageCurator.jpegData(compressionQuality: 0.1) else {
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
        data.append("Content-Disposition: form-data; name=\"card\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(cardNumber)\r\n".data(using: .utf8)!)
        
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
} //struct

struct ProfSettingsCurator_Previews: PreviewProvider {
    static var previews: some View {
        ProfSettingsCurator( name: "Gleb", surname: "Ptushkin", username: "gpgpgp", phoneNumber: "+77476273026", cardNumber: "677676767589393920", email: "hellotest@gmail.com", imageCurator: UIImage())
    }
}
