//
//  ProfilePhotoCircle.swift
//  JJApp
//
//  Created by Arnella Tolegen on 01.04.2023.
//

import SwiftUI

struct ProfilePhotoCircle: View {
    @State var imageUser: UIImage
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 130)
                .foregroundColor(Color(red: 0.366, green: 0.598, blue: 0.269))
                .shadow(radius: 4)
            
            Circle()
                .frame(width: 128)
                .foregroundColor(Color(red: 0.925, green: 0.925, blue: 0.925))
            
            Image(uiImage: imageUser)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 60)
        }.padding()
    }
}

struct ProfilePhotoCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoCircle(imageUser: UIImage(named: "NoProfileFoto")!)
    }
}
