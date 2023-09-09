//
//  TextFieldView.swift
//  JJApp
//
//  Created by ITSTEP on 17.03.2023.
//

import SwiftUI
import Combine

struct TextFieldGreen: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .frame(width: 270)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .tint(Color(red: 0.062, green: 0.414, blue: 0.23))
    }
}

struct TextFieldView: View {
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    @Binding var variable: String
    var fieldTextRU: String
    var fieldTextEN: String
    var fieldTextKZ: String
    var textLimit: Int
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: .leading, endPoint: .trailing))
                .frame(width: 300, height: 40)
    
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .frame(width: 298, height: 38)
                
            if languageDB[0].language == "RU"{
                TextField(fieldTextRU, text: $variable)
                    .modifier(TextFieldGreen())
                    .onReceive(Just(textLimit)) { _ in limitText(textLimit) }
            }
            else if languageDB[0].language == "EN"{
                TextField(fieldTextEN, text: $variable)
                    .modifier(TextFieldGreen())
                    .onReceive(Just(textLimit)) { _ in limitText(textLimit) }
            }
            else{
                TextField(fieldTextKZ, text: $variable)
                    .modifier(TextFieldGreen())
                    .onReceive(Just(textLimit)) { _ in limitText(textLimit) }
            }
        }
    }
    func limitText(_ upper: Int) {
            if variable.count > upper {
                variable = String(variable.prefix(upper))
            }
        }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(variable: .constant(""), fieldTextRU: "Имя", fieldTextEN: "Name", fieldTextKZ: "Аты", textLimit: 20)
    }
}
