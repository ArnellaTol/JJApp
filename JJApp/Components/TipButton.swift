//
//  TipWater.swift
//  JJApp
//
//  Created by ITSTEP on 24.03.2023.
//

import SwiftUI

struct TipButton: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    var textRU: String
    var textEN: String
    var textKZ: String
    var tipImage: String
    var body: some View {
        ZStack {
            //Form
            Group {
                RoundedRectangle(cornerRadius: 10)
                    .fill(LinearGradient(colors: [Color(red: 0.099, green: 0.43, blue: 0.232), Color(red: 0.465, green: 0.656, blue: 0.284)], startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 0, y: 0)))
                    .frame(width: 310, height: 100)
                    .shadow(color: .black, radius: 3)
                Image("TipSideMenu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 113)
                    .offset(x: -86,y: 0.83)
            }
            //Texts
            Group  {
                if languageDB[0].language == "RU"{
                    Text(textRU)
                        .font(.system(size: 21))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 200)
                        .offset(x: 60)
                }
                else if languageDB[0].language == "EN"{
                    Text(textEN)
                        .font(.system(size: 21))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 200)
                        .offset(x: 60)
                }
                else{
                    Text(textKZ)
                        .font(.system(size: 19))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 200)
                        .offset(x: 60)
                }
            }//Group end
            if tipImage == "TipWater" {
                Image(tipImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 160)
                    .offset(x: -90, y: -10)
            }
            else if tipImage == "TipShowel" {
                Image(tipImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 120)
                    .offset(x: -93, y: -5)
            }
            else if tipImage == "TipFertilizer" {
                Image(tipImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 160)
                    .offset(x: -95, y: 20)
            }
            else if tipImage == "TipBucket" {
                Image(tipImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 155)
                    .offset(x: -87, y: 5)
            }
            
            
        } //ZStack end
    }
}

struct TipWater_Previews: PreviewProvider {
    static var previews: some View {
        TipButton(textRU: "", textEN: "How to water a tree?", textKZ: "", tipImage: "")
    }
}
