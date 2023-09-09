//
//  TabCircle.swift
//  JJApp
//
//  Created by ITSTEP on 24.02.2023.
//

import SwiftUI

struct TabCircle: View {
    var body: some View {
        //Circle
        VStack {
            Spacer()
            Image("Circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }.ignoresSafeArea(.all)
    }
}

struct TabCircle_Previews: PreviewProvider {
    static var previews: some View {
        TabCircle()
    }
}
