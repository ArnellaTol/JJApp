//
//  NextRegButton.swift
//  JJApp
//
//  Created by Arnella Tolegen on 21.03.2023.
//

import SwiftUI

struct NextRegButton: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                .frame(width: 300, height: 50)
                .foregroundColor(Color.green)
                .shadow(color: .gray, radius: 3, x: 0, y: 3)
            
            if languageDB[0].language == "RU"{
                Text("Продолжить").foregroundColor(Color.white).font(.title3)
            }
            else if languageDB[0].language == "EN"{
                Text("Next").foregroundColor(Color.white).font(.title3)
            }
            else{
                Text("Жалғастыру").foregroundColor(Color.white).font(.title3)
            }
            
        }.padding()
    }
}

struct NextRegButton_Previews: PreviewProvider {
    static var previews: some View {
        NextRegButton()
    }
}
