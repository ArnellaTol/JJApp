//
//  RegionPicker.swift
//  JJApp
//
//  Created by Arnella Tolegen on 01.04.2023.
//

import SwiftUI

struct RegionPicker: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    var regionRU: [String] = ["Абайская область", "Акмолинская область", "Актюбинская область", "Алматинская область", "Атырауская область", "Восточно-Казахстанская область", "Жамбылская область", "Жетысуская область", "Карагандинская область", "Костанайская область", "Кызылординская область", "Мангистауская область", "Северо-Казахстанская область", "Павлодарская область", "Туркестанская область", "Улытауская область", "Западно-Казахстанская область"]
    var regionEN: [String] = ["Abai region", "Akmola region", "Aktobe region", "Almaty region", "Atyrau region", "East Kazakhstan region", "Zhambyl region", "Zhetisu region", "Karaganda region", "Kostanay region", "Kyzylorda region", "Mangystau region", "North Kazakhstan region", "Pavlodar region", "Turkestan region", "Ulytau region", "West Kazakhstan region"]
    var regionKZ: [String] = ["Абай облысы", "Ақмола облысы", "Ақтөбе облысы", "Алматы облысы", "Атырау облысы", "Шығыс Қазақстан облысы", "Жамбыл облысы", "Жетісу облысы", "Қарағанды облысы", "Қостанай облысы", "Қызылорда облысы", "Маңғыстау облысы", "Солтүстік Қазақстан облысы", "Павлодар облысы", "Түркістан облысы", "Ұлытау облысы", "Батыс Қазақстан облысы"]
    @State var indexRegion: Int
    var body: some View {
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
    }
    public func getRegionEN()->String{
        return regionEN[indexRegion]
    }
}

struct RegionPicker_Previews: PreviewProvider {
    static var previews: some View {
        RegionPicker(indexRegion: 0)
    }
}
