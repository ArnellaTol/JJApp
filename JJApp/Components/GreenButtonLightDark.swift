//
//  GreenButtonLightDark.swift
//  JJApp
//
//  Created by Arnella Tolegen on 02.04.2023.
//

import SwiftUI

struct GreenButtonLightDark: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
            .frame(width: 230, height: 50)
            .foregroundColor(Color.green)
            .shadow(color: .gray, radius: 3, x: 0, y: 3)
    }
}

struct GreenButtonLightDark_Previews: PreviewProvider {
    static var previews: some View {
        GreenButtonLightDark()
    }
}
