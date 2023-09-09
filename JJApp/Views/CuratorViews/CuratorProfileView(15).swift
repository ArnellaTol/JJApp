//
//  AdminProfileView.swift
//  JJApp
//
//  Created by Arnella Tolegen on 01.05.2023.
//

import SwiftUI


struct CuratorProfileView: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var tokensDB: FetchedResults<TokensDB>
    @State var name: String = ""
    @State var surname: String = ""
    @State var login: String = ""
    @State var phoneNumber: String = ""
    @State var email: String = ""
    @State var cardNumber: String = ""
    @State var organization: String = ""
    @State var region: String = ""
    @State private var showSheet = false
    @State var imageDataStaff: Data = Data()
    
    @State var loadImage: Bool = false
    
    var regionRU: [String] = ["Абайская область", "Акмолинская область", "Актюбинская область", "Алматинская область", "Атырауская область", "Восточно-Казахстанская область", "Жамбылская область", "Жетысуская область", "Карагандинская область", "Костанайская область", "Кызылординская область", "Мангистауская область", "Северо-Казахстанская область", "Павлодарская область", "Туркестанская область", "Улытауская область", "Западно-Казахстанская область"]
    var regionEN: [String] = ["Abai region", "Akmola region", "Aktobe region", "Almaty region", "Atyrau region", "East Kazakhstan region", "Zhambyl region", "Zhetisu region", "Karaganda region", "Kostanay region", "Kyzylorda region", "Mangystau region", "North Kazakhstan region", "Pavlodar region", "Turkestan region", "Ulytau region", "West Kazakhstan region"]
    var regionKZ: [String] = ["Абай облысы", "Ақмола облысы", "Ақтөбе облысы", "Алматы облысы", "Атырау облысы", "Шығыс Қазақстан облысы", "Жамбыл облысы", "Жетісу облысы", "Қарағанды облысы", "Қостанай облысы", "Қызылорда облысы", "Маңғыстау облысы", "Солтүстік Қазақстан облысы", "Павлодар облысы", "Түркістан облысы", "Ұлытау облысы", "Батыс Қазақстан облысы"]
    
    @State var msg: String = ""
    var body: some View {
        
        ZStack {
            Color(.white)
                .ignoresSafeArea(.all)
            TabCircle().offset(y: 60)
            //------------------------
            //[1]
            //Background (Foto)
            //если нет фото
            // ProfileBackgroundPhoto(image: imageCurator)
            
            //------------------------
            //[2]
            //White Background + Personal Info
            VStack {
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
                    Image(uiImage: imageDataStaff.image ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 108, height: 108)
                        .cornerRadius(108)
                }
                
                VStack(alignment: .leading) {
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
                            .font(.system(size: 21))
                    } .padding(.vertical, 2)
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
                            .font(.system(size: 21))
                    } .padding(.vertical, 2)
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
                            .font(.system(size: 21))
                    } .padding(.vertical, 2)
                    
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
                            .font(.system(size: 21))
                    } .padding(.vertical, 2)
                    
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
                            .font(.system(size: 21))
                    } .padding(.vertical, 2)
                    
                    VStack(alignment: .leading){
                        if languageDB[0].language == "RU" {
                            Text("Номер карты:")
                                .bold()
                                .modifier(TextTitleGreen())
                        }
                        else if languageDB[0].language == "EN" {
                            Text("Card number:")
                                .bold()
                                .modifier(TextTitleGreen())
                        }
                        else {
                            Text("Карта нөмірі:")
                                .bold()
                                .modifier(TextTitleGreen())
                        }
                        Text(self.cardNumber)
                            .font(.system(size: 21))
                    } .padding(.vertical, 2)
                    
                    VStack(alignment: .leading){
                        if languageDB[0].language == "RU" {
                            Text("Название организации:")
                                .bold()
                                .modifier(TextTitleGreen())
                        }
                        else if languageDB[0].language == "EN" {
                            Text("Name of organization:")
                                .bold()
                                .modifier(TextTitleGreen())
                        }
                        else {
                            Text("Ұйымның атауы:")
                                .bold()
                                .modifier(TextTitleGreen())
                        }
                        Text(self.organization)
                            .font(.system(size: 21))
                    } .padding(.vertical, 2)
                    
                    VStack(alignment: .leading){
                        if languageDB[0].language == "RU" {
                            Text("Область:")
                                .bold()
                                .modifier(TextTitleGreen())
                        }
                        else if languageDB[0].language == "EN" {
                            Text("Region:")
                                .bold()
                                .modifier(TextTitleGreen())
                        }
                        else {
                            Text("Облыс:")
                                .bold()
                                .modifier(TextTitleGreen())
                        }
                        Text(self.region)
                            .font(.system(size: 21))
                    } .padding(.vertical, 2)
                    Spacer()
                }
                
                
                //change destination
                NavigationLink(destination: ProfSettingsCurator(name: name, surname: surname, username: login, phoneNumber: phoneNumber, cardNumber: cardNumber, email: email, imageCurator: imageDataStaff.image ?? UIImage()), label: {
                    SettingsButton()
                    
                })
                
                HStack{
                    NavigationLink {
                        UserListCuratorView()
                    } label: {
                        IconsButtons(img: "home1")
                    }
                    IconsButtons(img: "profile2")
                    NavigationLink {
                        NewAppView()
                    } label: {
                        IconsButtons(img: "note1")
                    }
                }
            }
            
            //---------
            
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
            
            var obj = try? JSONDecoder().decode(StaffProfile.self, from: data)
            //print(obj?.user)
            name = obj?.staff?.first_name ?? ""
            surname = obj?.staff?.last_name ?? ""
            login = obj?.staff?.username ?? ""
            phoneNumber = obj?.staff?.phone_number ?? ""
            email = obj?.staff?.email ?? ""
            cardNumber = obj?.staff?.card ?? ""
            organization = obj?.staff?.organization ?? ""
            region = obj?.staff?.region ?? ""
            
            if obj?.staff?.photo != nil{
                loadImage = true
            }
            
            for i in 0..<regionEN.count {
                if regionEN[i] == region{
                    if languageDB[0].language == "RU" {
                        region = regionRU[i]
                    }
                    else if languageDB[0].language == "KZ" {
                        region = regionKZ[i]
                    }
                }
            }
            
            obj?.staff?.loadPhotoData { imageData in
                if let imageData = imageData {
                    imageDataStaff = imageData
                } else {
                    print("error load image")
                }
            }
            
        } else {
            print("=========> error")
        }
    }
}

struct AdminProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CuratorProfileView()
    }
}
