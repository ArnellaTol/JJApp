//
//  IconsButtons.swift
//  JJApp
//
//  Created by Arnella Tolegen on 26.03.2023.
//

import SwiftUI

struct IconsButtons: View {
    var img: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
            Image(img)
                .resizable()
                .frame(width: 40, height: 40)
        }.padding(10)
    }
}

struct IconsButtons_Previews: PreviewProvider {
    static var previews: some View {
        IconsButtons(img: "home1")
    }
}
