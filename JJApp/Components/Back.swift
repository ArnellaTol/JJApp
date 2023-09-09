//
//  Back.swift
//  JJApp
//
//  Created by Arnella Tolegen on 26.03.2023.
//

import SwiftUI

struct Back: View {
    var body: some View {
        Image(systemName: "chevron.backward.square")
            .resizable()
            .frame(width: 30, height: 30)
            .foregroundColor(Color(red: 0.069, green: 0.418, blue: 0.229))
            .padding(25)
    }
}

struct Back_Previews: PreviewProvider {
    static var previews: some View {
        Back()
    }
}
