//
//  ContentView.swift
//  JJApp
//
//  Created by Arnella Tolegen and Ptushkin Gleb on 25.01.2023.
//
//Design: Ready

import SwiftUI
import UIKit
import CoreData

extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}


struct LogInView: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @FetchRequest(sortDescriptors: []) var tokensDB: FetchedResults<TokensDB>
    @Environment(\.managedObjectContext) var moc
    
    @State var language: String = "EN"//= languageDB[0].language ?? "EN"

//    init() {
//        _language = State(initialValue: languageDB[0].language ?? "EN")
//        }
    
    @State var login: String = ""
    @State var password: String = ""
    @State var num: Int? = 0
    
    @State var notCorrect: Bool = false
    @State var goUser: Bool = false
    @State var goStaff: Bool = false
    @State var msg: String = ""
    
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Background()
                //Elements
                VStack{
                    
                    Spacer()
                    Spacer()
                    
                    LoginTextNature(language: $language)
                    
                    Spacer()
                    
                    
                    //Login, password, wrong log.
                    Group {
                        VStack {
                            if(notCorrect){
                                if language == "RU"{
                                    Text("Неверный логин или пароль").foregroundColor(.red)
                                }
                                else if language == "EN"{
                                    Text("Incorrect login or password").foregroundColor(.red)
                                }
                                else{
                                    Text("Логин немесе құпия сөз дұрыс емес").foregroundColor(.red)
                                }
                            }
                        } .frame(height: 20)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                                .frame(width: 300, height: 50)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .frame(width: 298, height: 48)
                            
                            
                            if language == "EN"{
                                TextField("Login", text: $login)
                                    .padding()
                                    .frame(width: 300, height: 40)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                            }
                            else{
                                TextField("Логин", text: $login)
                                    .padding()
                                    .frame(width: 300, height: 40)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                            }
                            
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                                .frame(width: 300, height: 50)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .frame(width: 298, height: 48)
                            
                            if language == "RU"{
                                SecureField("Пароль", text: $password)
                                    .padding()
                                    .frame(width: 300, height: 40)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                            }
                            else if language == "EN"{
                                SecureField("Password", text: $password)
                                    .padding()
                                    .frame(width: 300, height: 40)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                            }
                            else{
                                SecureField("Құпия сөз", text: $password)
                                    .padding()
                                    .frame(width: 300, height: 40)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                            }
                        }
                        
                    }
                    
                    Spacer()
                    
                    //Button "Войти"
                    
                    ZStack{
                        Button(action: {
                            sendRequestLogin()
                        }){
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(LinearGradient(colors: [Color(red: 0.062, green: 0.414, blue: 0.23), Color(red: 0.478, green: 0.664, blue: 0.282)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                                    .frame(width: 300, height: 50)
                                    .foregroundColor(Color.green)
                                    .shadow(color: .gray, radius: 3, x: 0, y: 3)
                                
                                if language == "RU"{
                                    Text("Войти").foregroundColor(Color.white).font(.title3)
                                }
                                else if language == "EN"{
                                    Text("Enter").foregroundColor(Color.white).font(.title3)
                                }
                                else{
                                    Text("Кіру").foregroundColor(Color.white).font(.title3)
                                }
                                
                            }
                        }.padding()
                        
                        
                        NavigationLink(destination:UserListCuratorView(names: []), isActive: $goStaff,
                                       label: { EmptyView() })
                        
                        
                        NavigationLink(destination:HomePageViewUser(), isActive: $goUser,
                                       label: { EmptyView() })
                    }
                    
                    
                    //Button "Зарегестрироваться"
                    
                    Button(action: {
                        notCorrect = false
                        self.num = 2
                    }){
                        NavigationLink(destination: RegTypeView(), label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                                    .frame(width: 300, height: 50)
                                    .foregroundColor(Color.green)
                                    .shadow(color: .gray, radius: 3, x: 0, y: 3)
                                
                                if language == "RU"{
                                    Text("Зарегистрироваться").foregroundColor(Color.white).font(.title3)
                                }
                                else if language == "EN"{
                                    Text("Registration").foregroundColor(Color.white).font(.title3)
                                }
                                else{
                                    Text("Тіркелу").foregroundColor(Color.white).font(.title3)
                                }
                                
                            }
                        })
                    }
                    .padding()
                    
                    
                    
                    
                    Spacer()
                    
                    
                    //Languages
                    HStack{
                        Button(action: {
                            language = "KZ"
                            if languageDB.isEmpty{
                                let lang = LanguageDB(context: moc)
                                lang.language = language
                            }
                            else{
                                languageDB[0].language = language
                            }
                            try? moc.save()
                        }){
                            ZStack{
                                Language()
                                Text("KZ")
                                    .foregroundColor(.black)
                            }
                        }.padding()
                        
                        Button(action: {
                            language = "EN"
                            if languageDB.isEmpty{
                                let lang = LanguageDB(context: moc)
                                lang.language = language
                            }
                            else{
                                languageDB[0].language = language
                            }
                            try? moc.save()
                        }){
                            ZStack{
                                Language()
                                Text("EN")
                                    .foregroundColor(.black)
                            }
                        }.padding()
                        
                        Button(action: {
                            language = "RU"
                            if languageDB.isEmpty{
                                let lang = LanguageDB(context: moc)
                                lang.language = language
                            }
                            else{
                                languageDB[0].language = language
                            }
                            try? moc.save()
                        }){
                            ZStack{
                                Language()
                                Text("RU")
                                    .foregroundColor(.black)
                            }
                        }.padding()
                        
                        
                        
                    }
                    
                }
            }.accessibilityHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                .accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
        }.navigationBarBackButtonHidden()
            .navigationViewStyle(.stack)
            .task {
                await languageChoose()
            }
        
        
    }
    func languageChoose() async {
        if languageDB.isEmpty{
            let lang = LanguageDB(context: moc)
            lang.language = language
        }
        else{
            language = languageDB[0].language ?? "EN"
        }
    }
    
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
            var obj = try? JSONDecoder().decode(Tokens.self, from: data)
            print(obj?.access ?? "")
            print(obj?.refresh ?? "")
            print(obj?.is_staff ?? "")
            
            if tokensDB.isEmpty{
            let tok = TokensDB(context: moc)
            tok.access = obj?.access ?? ""
            tok.refresh = obj?.refresh ?? ""
            tok.isStaff = obj?.is_staff ?? false
            tok.username = login
            try? moc.save()
            }
            else{
                tokensDB[0].access = obj?.access ?? ""
                tokensDB[0].refresh = obj?.refresh ?? ""
                tokensDB[0].isStaff = obj?.is_staff ?? false
                tokensDB[0].username = login
            }
            
            
            if (obj == nil) {
                notCorrect = true
            }
            else{
                notCorrect = false
                if ((obj?.is_staff) == true){
                    goStaff = true
                }
                else{
                    goUser = true
                }
            }
            
        } else {
            print("=========> error")
        }
    }
}


struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
