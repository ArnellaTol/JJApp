//
//  JJCoins.swift
//  JJApp
//
//  Created by ITSTEP on 24.02.2023.
//

import SwiftUI

struct JJCoins: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        
        //JJCoins
        ZStack {
            
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 282, height: 72)
                .foregroundColor(Color(red: 0.21, green: 0.493, blue: 0.248))
                .shadow(radius: 2)
                
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 280, height: 70)
                .foregroundColor(.white)
            
            Image("Leave")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80)
                .offset(x: -115, y: -15)
            
            if languageDB[0].language == "RU"{
                VStack(alignment: .leading) {
                    Text("Количество")
                        .font(.system(size: 17))
                    Text("JJCoins")
                        .font(.system(size: 17))
                } .offset(x: -15)
            }
            else if languageDB[0].language == "EN"{
                VStack(alignment: .leading) {
                    Text("The number")
                        .font(.system(size: 17))
                    Text("of JJCoins")
                        .font(.system(size: 17))
                } .offset(x: -15)
            }
            else{
                VStack(alignment: .leading) {
                    Text("JJCoins")
                        .font(.system(size: 17))
                    Text("саны")
                        .font(.system(size: 17))
                } .offset(x: -20)
            }
        }.frame(height: 80)
    }
}

struct JJCoins_Previews: PreviewProvider {
    static var previews: some View {
        JJCoins()
    }
}
