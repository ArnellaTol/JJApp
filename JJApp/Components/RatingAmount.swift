//
//  RatingAmount.swift
//  JJApp
//
//  Created by ITSTEP on 24.02.2023.
//

import SwiftUI

struct RatingAmount: View {
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
            
            Image("Star")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80)
                .offset(x: -115, y: -15)
            
            if languageDB[0].language == "RU"{
                VStack(alignment: .leading) {
                    Text("Ваше место")
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                    Text("в рейтинге")
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                } .offset(x: -15)
            }
            else if languageDB[0].language == "EN"{
                VStack(alignment: .leading) {
                    Text("Your place")
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                    Text("in the ranking")
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                } .offset(x: -15)
            }
            else{
                VStack(alignment: .leading) {
                    Text("Рейтингтегі")
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                    Text("орныңыз")
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                } .offset(x: -13)
            }
            
        }.frame(height: 80)
    }
}

struct RatingAmount_Previews: PreviewProvider {
    static var previews: some View {
        RatingAmount()
    }
}
