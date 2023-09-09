//
//  ProfileBackgroundPhoto.swift
//  JJApp
//
//  Created by Arnella Tolegen on 20.03.2023.
//

import SwiftUI

struct ProfileBackgroundPhoto: View {
    @State var image: UIImage
    var body: some View {
        VStack {
            ZStack {
                //если нет фото
                VStack {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color(red: 0.925, green: 0.925, blue: 0.925))
                        .ignoresSafeArea(.all)
                        .frame(width: 400, height: 350)
                    Spacer()
                }
                VStack {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 350)
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct ProfileBackgroundPhoto_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBackgroundPhoto(image: UIImage(named: "NoProfileFoto")!)
    }
}
