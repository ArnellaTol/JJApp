//
//  StatusPicker.swift
//  JJApp
//
//  Created by Arnella Tolegen on 01.04.2023.
//

import SwiftUI

struct StatusPicker: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    var statusRU: [String] = ["Студент", "Преподаватель", "Другое"]
    var statusEN: [String] = ["Student", "Teacher", "Other"]
    var statusKZ: [String] = ["Студент", "Оқытушы", "Басқа"]
    @State var indexStatus: Int
//    var currentStatusRU: String = ""
//    var currentStatusEN: String = ""
//    var currentStatusKZ: String = ""
    var body: some View {
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
    }
    public func getStatusEN()->String{
        return statusEN[indexStatus]
    }
}

struct StatusPicker_Previews: PreviewProvider {
    static var previews: some View {
        StatusPicker(indexStatus: 0)
    }
}
