//
//  HelpButton.swift
//  JJApp
//
//  Created by ITSTEP on 16.03.2023.
//

import SwiftUI

struct HelpButton: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 202, height: 61)
                .foregroundColor(Color(red: 0.21, green: 0.493, blue: 0.248))
                .shadow(radius: 2)
                
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 200, height: 60)
                .foregroundColor(.white)
            
            
            HStack{
                Image("Curator")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45)
                    
                //Spacer()
                if languageDB[0].language == "EN"{
                    Text("Curator")
                        .modifier(TextBlackSettings())
                        .padding(.horizontal, 7)
                }
                else{
                    Text("Куратор")
                        .modifier(TextBlackSettings())
                        .padding(.horizontal, 15)
                }
            }.frame(width: 200)
        }
    }
}

struct HelpButton_Previews: PreviewProvider {
    static var previews: some View {
        HelpButton()
    }
}
