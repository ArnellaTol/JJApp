//
//  RatingPosition.swift
//  JJApp
//
//  Created by ITSTEP on 04.04.2023.
//

import SwiftUI

struct RatingPosition: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    var name: String
    var JJCoins: Int
    var rating: Int
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(colors: [Color(red: 0.621, green: 0.805, blue: 0.42), Color(red: 0.932, green: 1.002, blue: 0.862) ], startPoint: .leading, endPoint: .trailing))
                .frame(width: 300, height: 50)
                .shadow(color: .gray, radius: 2, x: 0, y: 4)
            HStack() {
                Text("\(rating).")
                    .font(.system(size: 15))
                    .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))

                Text(name)
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                    .padding()
                Spacer()
                Text(String(JJCoins))
                    .font(.system(size: 15))
                    .foregroundColor(Color(red: 0.062, green: 0.414, blue: 0.23))
                    .padding(.trailing, 5)
            } .frame(width: 280, height: 50)
        }
        
        
        
        
    }
    
    
}



struct RatingPosition_Previews: PreviewProvider {
    static var previews: some View {
        RatingPosition(name: "Gleb Ptushkin", JJCoins: 100, rating: 1)
    }
}
