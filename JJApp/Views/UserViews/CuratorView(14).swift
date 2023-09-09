//
//  CuratorView.swift
//  JJApp
//
//  Created by Arnella Tolegen on 01.05.2023.
//

import SwiftUI

struct CuratorView: View {
    @Environment (\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @FetchRequest(sortDescriptors: []) var tokensDB: FetchedResults<TokensDB>
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    
    var regionRU: [String] = ["Абайская область", "Акмолинская область", "Актюбинская область", "Алматинская область", "Атырауская область", "Восточно-Казахстанская область", "Жамбылская область", "Жетысуская область", "Карагандинская область", "Костанайская область", "Кызылординская область", "Мангистауская область", "Северо-Казахстанская область", "Павлодарская область", "Туркестанская область", "Улытауская область", "Западно-Казахстанская область"]
    var regionEN: [String] = ["Abai region", "Akmola region", "Aktobe region", "Almaty region", "Atyrau region", "East Kazakhstan region", "Zhambyl region", "Zhetisu region", "Karaganda region", "Kostanay region", "Kyzylorda region", "Mangystau region", "North Kazakhstan region", "Pavlodar region", "Turkestan region", "Ulytau region", "West Kazakhstan region"]
    var regionKZ: [String] = ["Абай облысы", "Ақмола облысы", "Ақтөбе облысы", "Алматы облысы", "Атырау облысы", "Шығыс Қазақстан облысы", "Жамбыл облысы", "Жетісу облысы", "Қарағанды облысы", "Қостанай облысы", "Қызылорда облысы", "Маңғыстау облысы", "Солтүстік Қазақстан облысы", "Павлодар облысы", "Түркістан облысы", "Ұлытау облысы", "Батыс Қазақстан облысы"]
    
    @State var name: String = ""
    @State var surname: String = ""
    @State var phoneNumber: String = ""
    @State var email: String = ""
    @State var cardNumber: String = ""
    @State var organization: String = ""
    @State var region: String = ""
    
    @State private var showSheet = false
    
    @State var imageData: Data = Data()
    
    @State var loadImage: Bool = false
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea(.all)
            
            
            Spacer()
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss ()
                        }, label: {Back()})
                    })
                })
            
            VStack {
                ZStack{
                    Circle()
                        .frame(width: 130)
                        .foregroundColor(Color(red: 0.366, green: 0.598, blue: 0.269))
                        .shadow(radius: 4)
                    
                    Circle()
                        .frame(width: 128)
                        .foregroundColor(Color(red: 0.925, green: 0.925, blue: 0.925))
                    
                    Image("NoProfileFoto")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 128, height: 128)
                        .cornerRadius(128)
                    if loadImage{
                        Image("loading")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 128, height: 128)
                            .cornerRadius(128)
                    }
                    Image(uiImage: imageData.image ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 128, height: 128)
                        .cornerRadius(128)
                        
                }.padding()
                ZStack {
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
                        }.padding(.vertical, 2)
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
                    }
                }.frame(height: 460)
            }
            
        }.navigationBarBackButtonHidden()
            .task {
                await sendRequestProfileInfo()
            }
    }
    
    func sendRequestProfileInfo() async
    {
        let URL_ADDRESS: String = "http://34.22.215.91/api/v1/manager/"
        guard let url = URL(string: URL_ADDRESS) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        print(tokensDB[0].access)
        request.setValue("Bearer \(tokensDB[0].access ?? "")", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                //msg = "Error"
            } else if let data = data {
                sendDataProfile(data)
                
            } else {
                // Handle unexpected error
            }
        }
        task.resume()
    }
    
    func sendDataProfile(_ data: Data?) {
        if let data = data, let json = try? JSONSerialization.jsonObject(with: data) {
            print(json)
            let data1 = (try? JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)) ?? data
            let convertedString = String(data: data1, encoding: .utf8)
            var obj = try? JSONDecoder().decode(CuratorForUser.self, from: data)
            //print(obj?.user)
            name = obj?.manager?.first_name ?? ""
            surname = obj?.manager?.last_name ?? ""
            phoneNumber = obj?.manager?.phone_number ?? ""
            email = obj?.manager?.email ?? ""
            cardNumber = obj?.manager?.card ?? ""
            organization = obj?.manager?.organization ?? ""
            region = obj?.manager?.region ?? ""
            
//            if obj?.user?.photo != nil{
//                loadImage = true
//            }
        
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
            
            obj?.manager?.loadPhotoData { imageData in
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
}
struct CuratorView_Previews: PreviewProvider {
    static var previews: some View {
        CuratorView()
    }
}

/*
 «api/v1/group/id:str»
 - проваливаемсяв участников группы, надо подставить
 id студента. ТолькоGET запрос, вывод информации о студенте
 по ключу «user».




  «api/v1/manager/»
 - Принимаеттолько GET запрос, выводит куратора
 организации в которой состоитавторизованный пользователь. Данные
 можно получить по ключу «manager».
 */
