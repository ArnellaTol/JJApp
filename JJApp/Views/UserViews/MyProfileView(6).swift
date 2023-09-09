//
//  MyProfileView(6).swift
//  JJApp
//
//  Created by ITSTEP on 16.03.2023.
//
//Заменить SettingsButton, HelpButton на  NavigationLink!!!

import SwiftUI


struct TextTitleGreen: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(red: 0.074, green: 0.414, blue: 0.23))
            .font(.system(size: 18))
            
    }
}


//= UIImage(named: "NoProfileFoto")!
struct MyProfileView: View {
    
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var tokensDB: FetchedResults<TokensDB>
    
    @State var name: String = ""
    @State var surname: String = ""
    @State var login: String = ""
    @State var JJCoins: Int = 0
    @State var phoneNumber: String = ""
    @State var email: String = ""
    @State var status: String = ""
    @State var statusIndex: Int = 0
    @State private var showSheet = false
    @State var imageDataUser: Data = Data()
    
    @State var loadImage: Bool = false
    
    @State var msg = ""
    var body: some View {
        
        ZStack {
            Color(.white)
                .ignoresSafeArea(.all)
            TabCircle()
            
                    //Personal Info
                    VStack() {
                        ZStack{
                            Circle()
                                .frame(width: 110)
                                .foregroundColor(Color(red: 0.366, green: 0.598, blue: 0.269))
                                .shadow(radius: 4)
                            
                            Circle()
                                .frame(width: 108)
                                .foregroundColor(Color(red: 0.925, green: 0.925, blue: 0.925))
                            
                            Image("NoProfileFoto")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 108, height: 108)
                                .cornerRadius(108)
                            
                            if loadImage{
                                Image("loading")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 108, height: 108)
                                    .cornerRadius(108)
                            }
                            
                            Image(uiImage: imageDataUser.image ?? UIImage())
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 108, height: 108)
                                .cornerRadius(108)
                        }.padding()
                        VStack(alignment: .leading){
                            //Name
                            HStack {
                                if languageDB[0].language == "RU" {
                                    Text("Имя:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                    
                                }
                                else if languageDB[0].language == "EN" {
                                    Text("Name:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                } else {
                                    Text("Аты:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                }
                                
                                Text(self.name)
                                    .font(.system(size: 18))
                            } .padding(.vertical, 1)
                            //Surname
                            HStack {
                                if languageDB[0].language == "RU" {
                                    Text("Фамилия:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                }
                                else if languageDB[0].language == "EN" {
                                    Text("Surname:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                }
                                else {
                                    Text("Тегі:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                }
                                Text(self.surname)
                                    .font(.system(size: 18))
                            } .padding(.vertical, 1)
                            //Login
                            HStack {
                                if languageDB[0].language == "EN" {
                                    Text("Login:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                } else {
                                    Text("Логин:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                }
                                Text(self.login)
                                    .font(.system(size: 18))
                            } .padding(.vertical, 1)
                            
                            VStack(alignment: .leading) {
                                if languageDB[0].language == "RU" {
                                    Text("Контактный номер:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                }
                                else if languageDB[0].language == "EN" {
                                    Text("Phone number:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                }
                                else {
                                    Text("Байланыс нөмірі:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                }
                                Text(self.phoneNumber)
                                    .font(.system(size: 18))
                            } .padding(.vertical, 1)
                            
                            VStack(alignment: .leading){
                                if languageDB[0].language == "RU" {
                                    Text("Почта:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                }
                                else if languageDB[0].language == "EN" {
                                    Text("Email:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                }
                                else {
                                    Text("Пошта:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                }
                                Text(self.email)
                                    .font(.system(size: 18))
                            } .padding(.vertical, 1)
                            
                            HStack {
                                if languageDB[0].language == "RU" {
                                    Text("Статус:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                    if status == "Student"{
                                        Text("Студент")
                                            .font(.system(size: 18))
                                    }
                                    else if status == "Teacher"{
                                        Text("Преподаватель")
                                            .font(.system(size: 18))
                                    }
                                    else{
                                        Text("Другое")
                                            .font(.system(size: 18))
                                    }
                                }
                                else if languageDB[0].language == "EN" {
                                    Text("Status:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                    Text(status)
                                        .font(.system(size: 18))
                                } else {
                                    Text("Мәртебесі:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                    if status == "Student"{
                                        Text("Студент")
                                            .font(.system(size: 18))
                                    }
                                    else if status == "Teacher"{
                                        Text("Оқытушы")
                                            .font(.system(size: 18))
                                    }
                                    else{
                                        Text("Басқа")
                                            .font(.system(size: 18))
                                    }
                                }
                            } .padding(.vertical, 1)
                            
                            //Count JJCoins
                            HStack {
                                if languageDB[0].language == "RU" {
                                    Text("Количество JJCoins:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                }
                                else if languageDB[0].language == "EN" {
                                    Text("Amount of JJCoins:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                } else {
                                    Text("Jjcoins саны:")
                                        .bold()
                                        .modifier(TextTitleGreen())
                                }
                                Text(String(self.JJCoins))
                                    .font(.system(size: 18))
                                
                            } .padding(.vertical, 1)
                        }
                    
                
            
            
            
                Spacer()
                
                        NavigationLink(destination: ProfileSettingsView(indexStatus: statusIndex, name: name, surname: surname, username: login, phoneNumber: phoneNumber, email: email, imageUser: imageDataUser.image ?? UIImage()), label: {
                    SettingsButton()
                    
                })
                
                
                //!!!!!!
                NavigationLink(destination: CuratorView(), label: {
                    HelpButton()
                        .padding(1)
                })
                
                
           
                
                HStack{
                    NavigationLink {
                        HomePageViewUser()
                    } label: {
                        IconsButtons(img: "home1")
                    }
                    IconsButtons(img: "profile2")
                    NavigationLink {
                        NoteView()
                    } label: {
                        IconsButtons(img: "note1")
                    }
                }
            }
        } .navigationBarBackButtonHidden()
            .task {
                await sendRequestProfileInfo()
            }
    }
    
    func sendRequestProfileInfo() async
    {

        let URL_ADDRESS: String = "http://34.22.215.91/api/v1/per-cab/"
        guard let url = URL(string: URL_ADDRESS) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        print(tokensDB[0].access)
        request.setValue("Bearer \(tokensDB[0].access ?? "")", forHTTPHeaderField: "Authorization")
        
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
            
            name = obj?.user?.first_name ?? ""
            surname = obj?.user?.last_name ?? ""
            login = obj?.user?.username ?? ""
            JJCoins = obj?.user?.coins ?? 0
            phoneNumber = obj?.user?.phone_number ?? ""
            email = obj?.user?.email ?? ""
            status = obj?.user?.status ?? ""
            
            if status == "Student"{
                statusIndex = 0
            }
            else if status == "Teacher"{
                statusIndex = 1
            }
            else{
                statusIndex = 2
            }
            
            if obj?.user?.photo != nil{
                loadImage = true
            }
            
            obj?.user?.loadPhotoData { imageData in
                if let imageData = imageData {
                    imageDataUser = imageData
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
    
    
    
    
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}

