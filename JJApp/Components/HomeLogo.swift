//
//  HomeLogo.swift
//  JJApp
//
//  Created by ITSTEP on 24.02.2023.
//

import SwiftUI

struct HomeLogo: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        HStack {
            VStack {
                Text("JJApp")
                    .foregroundColor(Color(red: 0.069, green: 0.418, blue: 0.229))
                    .bold()
                    .font(.system(size: 40))
                if languageDB[0].language == "RU"{
                    Text("С заботой о природе")
                        .bold()
                        .foregroundColor(Color(red: 0.069, green: 0.418, blue: 0.229))
                        .font(.system(size: 19))
                        .tracking(-0.5)
                }
                else if languageDB[0].language == "EN"{
                    Text("With care for nature")
                        .bold()
                        .foregroundColor(Color(red: 0.069, green: 0.418, blue: 0.229))
                        .font(.system(size: 19))
                        .tracking(-0.5)
                }
                else{
                    Text("Көгалдандыруға өз үлесіңді қос")
                        .bold()
                        .foregroundColor(Color(red: 0.069, green: 0.418, blue: 0.229))
                        .font(.system(size: 19))
                        .tracking(-0.5)
                }
                
            }
            
            //Logo
            ZStack {
                Circle()
                    .frame(width: 110)
                    .foregroundColor(Color(red: 0.366, green: 0.598, blue: 0.269))
                    .shadow(radius: 4)
                
                Circle()
                    .frame(width: 108)
                    .foregroundColor(.white)
                
                Image("JJAppLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 80)
                
                
                
            }
        }.padding()
    }
    
}

struct HomeLogo_Previews: PreviewProvider {
    static var previews: some View {
        HomeLogo()
    }
}
