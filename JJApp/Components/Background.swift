//
//  Background.swift
//  JJApp
//
//  Created by ITSTEP on 24.02.2023.
//

import SwiftUI

struct Background: View {
    var body: some View {
        //Background
        Image("Background")
            .resizable()
            .ignoresSafeArea(.all)
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
