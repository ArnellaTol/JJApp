//
//  RegUser(3).swift
//  JJApp
//
//  Created by Arnella Tolegen on 05.02.2023.
//
//Выпадающее меню: Статус, Город/Регион

import SwiftUI
import UIKit

struct RegUserView: View {
    @Environment (\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @FetchRequest(sortDescriptors: []) var tokensDB: FetchedResults<TokensDB>
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    
    var regionRU: [String] = ["Абайская область", "Акмолинская область", "Актюбинская область", "Алматинская область", "Атырауская область", "Восточно-Казахстанская область", "Жамбылская область", "Жетысуская область", "Карагандинская область", "Костанайская область", "Кызылординская область", "Мангистауская область", "Северо-Казахстанская область", "Павлодарская область", "Туркестанская область", "Улытауская область", "Западно-Казахстанская область"]
    var regionEN: [String] = ["Abai region", "Akmola region", "Aktobe region", "Almaty region", "Atyrau region", "East Kazakhstan region", "Zhambyl region", "Zhetisu region", "Karaganda region", "Kostanay region", "Kyzylorda region", "Mangystau region", "North Kazakhstan region", "Pavlodar region", "Turkestan region", "Ulytau region", "West Kazakhstan region"]
    var regionKZ: [String] = ["Абай облысы", "Ақмола облысы", "Ақтөбе облысы", "Алматы облысы", "Атырау облысы", "Шығыс Қазақстан облысы", "Жамбыл облысы", "Жетісу облысы", "Қарағанды облысы", "Қостанай облысы", "Қызылорда облысы", "Маңғыстау облысы", "Солтүстік Қазақстан облысы", "Павлодар облысы", "Түркістан облысы", "Ұлытау облысы", "Батыс Қазақстан облысы"]
    @State var indexRegion: Int = 0
    
    var statusRU: [String] = ["Студент", "Преподаватель", "Другое"]
    var statusEN: [String] = ["Student", "Teacher", "Other"]
    var statusKZ: [String] = ["Студент", "Оқытушы", "Басқа"]
    @State var indexStatus: Int = 0
    
    @State var notCorrect: Bool = false
    @State var goNextView: Bool = false
    
    @State var name: String
    @State var surname: String
    @State var login: String
    @State var password: String
    @State var repeatPassword: String
    @State var organisation: String
    @State var phoneNumber: String
    @State var email: String
    
    @State var msg: String = ""
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea(.all)
            
            //Elements
            VStack{
                Spacer()
                    .toolbar(content: {
                        ToolbarItem(placement: .navigationBarLeading, content: {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss ()
                            }, label: {Back()})
                        })
                    })
                
                //Выбор (Text)
                TextTitleRegistration()
                
                //Fields (Data)
                Group{
                    VStack {
                        if(notCorrect){
                            if languageDB[0].language == "RU"{
                                Text("Неверные данные").foregroundColor(.red)
                            }
                            else if languageDB[0].language == "EN"{
                                Text("Incorrect data").foregroundColor(.red)
                            }
                            else{
                                Text("Деректер дұрыс емес").foregroundColor(.red)
                            }
                        }
                    } .frame(height: 20)
                    Group{
                        TextFieldView(variable: $name, fieldTextRU: "Имя", fieldTextEN: "Name", fieldTextKZ: "Аты", textLimit: 100)
                        
                        TextFieldView(variable: $surname, fieldTextRU: "Фамилия", fieldTextEN: "Surname", fieldTextKZ: "Тегі", textLimit: 100)
                        
                        TextFieldView(variable: $login, fieldTextRU: "Логин", fieldTextEN: "Login", fieldTextKZ: "Кіру", textLimit: 100)
                        
                        TextFieldView(variable: $password, fieldTextRU: "Пароль", fieldTextEN: "Password", fieldTextKZ: "Құпия сөз", textLimit: 100)
                        
                        TextFieldView(variable: $repeatPassword, fieldTextRU: "Повторите пароль", fieldTextEN: "Repeat the password", fieldTextKZ: "Құпия сөзді қайталаңыз", textLimit: 100)
                        
                        TextFieldView(variable: $phoneNumber, fieldTextRU: "Контактный номер", fieldTextEN: "Phone number", fieldTextKZ: "Байланыс нөмірі", textLimit: 12)
                        
                        
                        TextFieldView(variable: $email, fieldTextRU: "Почта", fieldTextEN: "Email", fieldTextKZ: "Пошта", textLimit: 100)
                    }
                    //Status Picker
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
                    
                    //Region Picker
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                            .frame(width: 300, height: 40)
                
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .frame(width: 298, height: 38)
                        HStack{
                            Menu(content: {
                                Picker("", selection: $indexRegion, content: {
                                    ForEach(0..<regionRU.count){ i in
                                        if languageDB[0].language == "RU"{
                                            Text(regionRU[i])
                                        }else if languageDB[0].language == "EN"{
                                            Text(regionEN[i])
                                        }else{
                                            Text(regionKZ[i])
                                        }
                                        
                                    }
                                })
                            }, label: {
                                if languageDB[0].language == "RU"{
                                    Text(regionRU[indexRegion])
                                }
                                else if languageDB[0].language == "EN"{
                                    Text(regionEN[indexRegion])
                                }
                                else{
                                    Text(regionKZ[indexRegion])
                                }
                                Image(systemName: "chevron.up.chevron.down")
                            })
                            .frame(width: 200, height: 40)
                            .foregroundColor(Color(red: 0.478, green: 0.664, blue: 0.282))
                        }
                        .padding()
                        .frame(width: 300, height: 40)
                    }
                    
                    
                    TextFieldView(variable: $organisation, fieldTextRU: "Название организации", fieldTextEN: "Name of the organization", fieldTextKZ: "Ұйымның атауы", textLimit: 100)
                    
                }
                
                
                ZStack{
                    Button(action: {
                        sendRequestRegistrationUser()
                        //sendRequestLogin()
                        //print("AAAAAAAAAAAAAAA")
                    }){
                        NextRegButton()
                    }
                    
                    NavigationLink(destination: HomePageViewUser(), isActive: $goNextView, label: { EmptyView() })
                }
                
                Spacer()
            }
            
        }.navigationBarBackButtonHidden()

            
    }
    func sendRequestRegistrationUser() 
    {
        var responseData = [
            "first_name": name,
            "last_name": surname,
            "username": login,
            "password": password,
            "repeat_password": repeatPassword,
            "phone_number": phoneNumber,
            "status": statusEN[indexStatus],
            "email": email,
            "organization": organisation,
            "region": regionEN[indexRegion]
        ]
        print(name,surname,login,password,repeatPassword,phoneNumber,email,statusEN[indexStatus], regionEN[indexRegion],organisation)
        var sendingData = try! JSONEncoder().encode(responseData)
        let URL_ADDRESS: String = "http://34.22.215.91/api/v1/user-reg/"
        guard let url = URL(string: URL_ADDRESS) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = sendingData
        msg = "Loading..."
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                msg = "Error"
            } else if let data = data {
                sendDataRegistrationUser(data)
            } else {
                // Handle unexpected error
                msg = "unexpected Error"
            }
        }
        task.resume()
    }
    
    func sendDataRegistrationUser(_ data: Data?) {
        if let data = data, let json = try? JSONSerialization.jsonObject(with: data) {
            print(json)
            var obj = try? JSONDecoder().decode(ResponseDataSuccess.self, from: data)
            print(obj?.success?.message)
            sendRequestLogin()
        } else {
            print("=========> error")
        }
    }
    // //////////////
    
    func sendRequestLogin()
    {
        var responseData = [
            "username": login,
            "password": password
        ]
        
        var sendingData = try! JSONEncoder().encode(responseData)
        let URL_ADDRESS: String = "http://34.22.215.91/api/token/"
        guard let url = URL(string: URL_ADDRESS) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = sendingData
        msg = "Loading..."
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                msg = "Error"
            } else if let data = data {
                sendDataLogin(data)
                
                if (tokensDB[0].access!.isEmpty) || (tokensDB[0].access == nil) {
                    notCorrect = true
                }
                else{
                    notCorrect = false
                    goNextView = true
                }
                
            } else {
                // Handle unexpected error
                msg = "unexpected Error"
            }
        }
        task.resume()
        
        
    }
    
    func sendDataLogin(_ data: Data?) {
        if let data = data, let json = try? JSONSerialization.jsonObject(with: data) {
    
            let data1 = (try? JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)) ?? data
            let convertedString = String(data: data1, encoding: .utf8)
            var obj = try! JSONDecoder().decode(Tokens.self, from: data)
            print(obj.access ?? "")
            print(obj.refresh ?? "")
            print(obj.is_staff ?? "")
            
            if tokensDB.isEmpty{
                let tok = TokensDB(context: moc)
                tok.access = obj.access ?? ""
                tok.refresh = obj.refresh ?? ""
                tok.isStaff = obj.is_staff ?? false
                tok.username = login
            }
            else{
                tokensDB[0].access = obj.access ?? ""
                tokensDB[0].refresh = obj.refresh ?? ""
                tokensDB[0].isStaff = obj.is_staff ?? false
                tokensDB[0].username = login
            }
            try? moc.save()
            
        } else {
            print("=========> error")
        }
    }
    
}

struct RegUserView_Previews: PreviewProvider {
    @State var text = ""
    static var previews: some View {
        RegUserView(name: "", surname: "", login: "", password: "", repeatPassword: "", organisation: "", phoneNumber: "", email: "")
            .previewInterfaceOrientation(.portrait)
    }
}
