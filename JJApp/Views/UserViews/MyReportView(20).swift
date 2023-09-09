//
//  MyReportView(20).swift
//  JJApp
//
//  Created by Arnella Tolegen on 13.06.2023.
//

import SwiftUI

struct MyReportView_20_: View {
    @Environment (\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @FetchRequest(sortDescriptors: []) var tokensDB: FetchedResults<TokensDB>
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    
    var statusRU: [Int:String] = [1:"Поливка дерева", 2:"Разрыхление дерева", 3:"Побелка дерева", 4:"Удобрение дерева"]
    var statusEN: [Int:String] = [1:"Watering the tree", 2:"Loosening the tree", 3:"Whitewashing the tree", 4:"Fertilizing the tree"]
    var statusKZ: [Int:String] = [1:"Ағашты суару", 2:"Ағашты қопсыту", 3:"Ағашты ағарту", 4:"Ағашты ұрықтандыру"]
    
    @State var reportFromList: ObjectReportInList
    @State var reportFull: ReportFull = ReportFull(approved: nil, date_upload: "", id: 0, photo: "", report: 0, title: "", user: "")
    @State var jjcoins: Int = 0
    @State var imageData: Data = Data()
    
    @State private var confirmationShown = false
    @State var areyousure: [String] = ["","",""]
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
                    Text("Просмотр отчета")
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .font(.system(size: 30))
                        .bold()
                        .padding(.vertical)
                    
                }
                else if languageDB[0].language == "EN"{
                    Text("Viewing the report")
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .font(.system(size: 30))
                        .bold()
                    .padding(.vertical)
                }
                else{
                    Text("Есепті қарау")
                        .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                        .font(.system(size: 30))
                        .bold()
                    .padding(.vertical)
                    
                }
                Spacer()
            }
            
            VStack(alignment: .leading){
                
                HStack() {
                    if languageDB[0].language == "RU"{
                        Text("Действия:")
                            .bold()
                            .modifier(TextTitleGreen())
                        Text("\(statusRU[reportFull.report] ?? "")")
                            .font(.system(size: 21))
                    }
                    else if languageDB[0].language == "EN" {
                        Text("Actions:")
                            .bold()
                            .modifier(TextTitleGreen())
                        Text("\(statusEN[reportFull.report] ?? "")")
                            .font(.system(size: 21))
                    } else {
                        Text("Әрекеттер:")
                            .bold()
                            .modifier(TextTitleGreen())
                        Text("\(statusKZ[reportFull.report] ?? "")")
                            .font(.system(size: 21))
                    }
                    
                } .padding(.vertical, 2)
                
                HStack {
                    Text("JJcoins:")
                        .bold()
                        .modifier(TextTitleGreen())
                    
                    Text("\(jjcoins)")
                        .font(.system(size: 21))
                } .padding(.vertical, 2)
                
                if languageDB[0].language == "RU"{
                    Text("Описание:")
                        .bold()
                        .modifier(TextTitleGreen())
                }
                else if languageDB[0].language == "EN" {
                    Text("Description:")
                        .bold()
                        .modifier(TextTitleGreen())
                } else {
                    Text("Сипаттама:")
                        .bold()
                        .modifier(TextTitleGreen())
                }
                Text("\(reportFull.title)")
                    .font(.system(size: 21))
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
            
            ZStack{
                //если отчет принятый то его менять нельзя
                if reportFull.approved != true{
                    NavigationLink(destination: EditReportView(report: reportFull, reportText: reportFull.title, imageReport: (imageData.image ?? UIImage()), indexStatus: (reportFull.report-1)), label: {
                        
                        ZStack{
                            GreenButtonLightDark()
                            
                            if languageDB[0].language == "RU"{
                                Text("Изменить").foregroundColor(.white).font(.title3)
                            }
                            else if languageDB[0].language == "EN"{
                                Text("Edit").foregroundColor(.white).font(.title3)
                            }
                            else{
                                Text("Өзгерту").foregroundColor(.white).font(.title3)
                            }
                            
                        }.padding()
                        
                    })
                }
                HStack{
                    Spacer()
                    Button(action: {
                        //delete report
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
            
        }.navigationBarBackButtonHidden()
            .task {
                await sendRequestReport()
            }
            .alert(isPresented: $confirmationShown) {
                        Alert(title:Text(areyousure[0]),
                            message: nil,
                              primaryButton: .destructive(Text(areyousure[1]).foregroundColor(.red), action: {
                                sendDeleteRequestReport()
                            }),
                            secondaryButton: .cancel(Text(areyousure[2]))
                        )
                    }
    }
    
    func sendRequestReport() async
    {
        let URL_ADDRESS: String = "http://34.22.215.91/api/v1/student-report/\(reportFromList.id)/"
        guard let url = URL(string: URL_ADDRESS) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        print(tokensDB[0].access)
        request.setValue("Bearer \(tokensDB[0].access ?? "")", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
            } else if let data = data {
                sendDataReport(data)
                
            } else {
                // Handle unexpected error
            }
        }
        task.resume()
    }
    
    func sendDataReport(_ data: Data?) {
        if let data = data, let json = try? JSONSerialization.jsonObject(with: data) {
            print(json)
            let data1 = (try? JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)) ?? data
            let convertedString = String(data: data1, encoding: .utf8)
            var obj = try? JSONDecoder().decode(ReportFullData.self, from: data)
            reportFull = obj?.report ?? ReportFull(approved: nil, date_upload: "", id: 0, photo: "", report: 0, title: "", user: "")
            jjcoins = reportFull.report*10
            
            reportFull.loadPhotoData { imageData in
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
    
    func sendDeleteRequestReport() {
        let URL_ADDRESS: String = "http://34.22.215.91/api/v1/student-report/\(reportFromList.id)/"
        guard let url = URL(string: URL_ADDRESS) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        print(tokensDB[0].access)
        request.setValue("Bearer \(tokensDB[0].access ?? "")", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
            } else if let data = data {
                // Handle response data if needed
                print("DELETE request success")
            } else {
                // Handle unexpected error
            }
        }
        task.resume()
    }

}

struct MyReportView_20__Previews: PreviewProvider {
    static var previews: some View {
        MyReportView_20_(reportFromList: ObjectReportInList(approved: false, date_upload: "", id: 0, title: ""), reportFull: ReportFull(approved: false, date_upload: "", id: 0, photo: "", report: 0, title: "", user: ""))
    }
}
