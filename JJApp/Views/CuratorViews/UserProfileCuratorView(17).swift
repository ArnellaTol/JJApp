//
//  UserProfileCuratorView.swift
//  JJApp
//
//  Created by ITSTEP on 11.05.2023.
//

import SwiftUI


struct UserProfileCuratorView: View {
    @Environment (\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @FetchRequest(sortDescriptors: []) var tokensDB: FetchedResults<TokensDB>
    @Environment(\.managedObjectContext) var moc

    @State var msg = ""
    
    @State var login = ""
    @State var name = ""
    @State var phone = ""
    @State var email = ""
    @State var raiting: Int
    @State var coins = -1
    @State var status = ""
    
    @State var imageData: Data = Data()
    
    @State var id: Int
    
    @State var loadImage: Bool = false
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                    .toolbar(content: {
                        ToolbarItem(placement: .navigationBarLeading, content: {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss ()
                            }, label: {Back()})
                        })
                    })
                //Circle
                ZStack {
                    Circle()
                        .fill(Color(red: 0.102, green: 0.432, blue: 0.237))
                        .frame(width: 232)
                    Circle()
                        .fill(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 230)
                    Image("NoProfileFoto")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 230, height: 230)
                        .cornerRadius(230)
                    
                    if loadImage{
                        Image("loading")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 230, height: 230)
                            .cornerRadius(230)
                    }
                    
                    
                    Image(uiImage: imageData.image ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 230, height: 230)
                        .cornerRadius(230)
                    
                }.padding() //Zstack - Circle
                VStack(alignment: .leading) {
                    UserInfo(criteriaRU: "Логин", criteriaEN: "Login", criteriaKZ: "Логин", info: login)
                    UserInfo(criteriaRU: "Имя", criteriaEN: "Name", criteriaKZ: "Аты", info: name)
                    UserInfo(criteriaRU: "Телефон", criteriaEN: "Phone", criteriaKZ: "Тел. нөмірі", info: phone)
                    UserInfo(criteriaRU: "Почта", criteriaEN: "Email", criteriaKZ: "Пошта", info: email)
                    UserInfo(criteriaRU: "Рейтинг", criteriaEN: "Rating", criteriaKZ: "Рейтинг", info: String(raiting))
                    UserInfo(criteriaRU: "Кол. JJCoins", criteriaEN: "Num. of JJCoins", criteriaKZ: "JJcoins Саны", info: String(coins))
                    HStack {
                        if languageDB[0].language == "RU" {
                            Text("Статус:")
                                .bold()
                                .modifier(TextTitleGreen())
                            if status == "Student"{
                                Text("Студент")
                                    .font(.system(size: 21))
                            }
                            else if status == "Teacher"{
                                Text("Преподаватель")
                                    .font(.system(size: 21))
                            }
                            else{
                                Text("Другое")
                                    .font(.system(size: 21))
                            }
                        }
                        else if languageDB[0].language == "EN" {
                            Text("Status:")
                                .bold()
                                .modifier(TextTitleGreen())
                            Text(status)
                                .font(.system(size: 21))
                        } else {
                            Text("Мәртебесі:")
                                .bold()
                                .modifier(TextTitleGreen())
                            if status == "Student"{
                                Text("Студент")
                                    .font(.system(size: 21))
                            }
                            else if status == "Teacher"{
                                Text("Оқытушы")
                                    .font(.system(size: 21))
                            }
                            else{
                                Text("Басқа")
                                    .font(.system(size: 21))
                            }
                        }
                        
                        
                    } .padding(.vertical, 2)
//                    UserInfo(language: $language, criteriaRU: "Заявки в с/п", criteriaEN: "Support requests", criteriaKZ: "Қ/қ өтінім", info: String(JJCoins))
                }
                Spacer()
            } //Vstack
            
            
        }.navigationBarBackButtonHidden()//ZStack
            .task {
                await sendRequestProfileInfo()
            }
    } //body
    
    func sendRequestProfileInfo() async
    {
//        var responseData = [
//            "username": login,
//            "password": password
//        ]
        
        //var sendingData = try! JSONEncoder().encode(responseData)
        let URL_ADDRESS: String = "http://34.22.215.91/api/v1/group/\(id)/"
        print(id)
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
            var obj = try? JSONDecoder().decode(UserProfile.self, from: data)
            //print(obj?.user)
            name = "\(obj?.user?.first_name ?? "") \(obj?.user?.last_name ?? "")"
            login = obj?.user?.username ?? ""
            coins = obj?.user?.coins ?? -1
            phone = obj?.user?.phone_number ?? ""
            email = obj?.user?.email ?? ""
            status = obj?.user?.status ?? ""
            
            if obj?.user?.photo != nil{
                loadImage = true
            }
            
            obj?.user?.loadPhotoData { imageData in
                if let imageData = imageData {
                    self.imageData = imageData
                    // Используйте imageData для отображения изображения или выполнения других операций с ним
                } else {
                    print("error load image")
                    // Обработайте случай, если данные изображения не были загружены
                }
            }
            
        } else {
            print("=========> error")
        }
    }
    
} //struct

struct UserProfileCuratorView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileCuratorView(raiting: 0, id: 0)
    }
}


struct UserInfo: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    
    //-------
    var criteriaRU: String
    var criteriaEN: String
    var criteriaKZ: String
    //-------
    var info: String
    // @Binding var imageCurator: UIImage
    var body: some View {
        HStack {
            if languageDB[0].language == "RU" {
                Text("\(criteriaRU):")
                    .foregroundColor(Color(red: 0.102, green: 0.432, blue: 0.237))
                    .bold()
                    .font(.system(size: 20))
            }
            else if languageDB[0].language == "EN" {
                Text("\(criteriaEN):")
                    .foregroundColor(Color(red: 0.102, green: 0.432, blue: 0.237))
                    .bold()
                    .font(.system(size: 20))            }
            else {
                Text("\(criteriaKZ):")
                    .foregroundColor(Color(red: 0.102, green: 0.432, blue: 0.237))
                    .bold()
                    .font(.system(size: 20))
            }
            Text(info)
                .foregroundColor(.black)
                .font(.system(size: 20))
            
        } .padding(2)
    }
}
