//
//  SendReportButton.swift
//  JJApp
//
//  Created by Arnella Tolegen on 20.03.2023.
//

import SwiftUI

struct SendReportButton: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(.white)
                .frame(width: 250, height: 50)
                .shadow(radius: 10)
            if languageDB[0].language == "RU" {
                Text("Отправить отчет")
                    .tracking(1)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            } else if languageDB[0].language == "EN" {
                Text("Send a report")
                    .tracking(1)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            } else {
                Text("Есеп жіберу")
                    .tracking(1)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
        }
    }
}

struct SendReportButton_Previews: PreviewProvider {
    static var previews: some View {
        SendReportButton()
    }
}
