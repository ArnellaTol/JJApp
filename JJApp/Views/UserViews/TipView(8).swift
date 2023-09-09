//
//  TipView(8).swift
//  JJApp
//
//  Created by ITSTEP on 24.03.2023.
//

import SwiftUI

struct HeadingModifier: ViewModifier {
    var size: Float = 30
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(red: 0.074, green: 0.414, blue: 0.23))
            .font(.system(size: CGFloat(size)))
    }
}
//------------------------------------------
struct TipView: View {
    @Environment (\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
    @Environment(\.managedObjectContext) var moc
    
    @State var imagePNG: String
    @State var textRU: String
    @State var textEN: String
    @State var textKZ: String
    @State var headingRU: String
    @State var headingEN: String
    @State var headingKZ: String
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea(.all)
            VStack {
                Image(imagePNG)
                    .resizable()
                .aspectRatio(contentMode: .fit)
                Spacer()
                    
            }.ignoresSafeArea(.all)
            
            Spacer()
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss ()
                        }, label: {Back()})
                    })
                })
            
            VStack {
                
                Spacer().frame(height: 200)
                
                if languageDB[0].language == "RU" {
                    Text(headingRU)
                        .modifier(HeadingModifier())
                }
                else if languageDB[0].language == "EN" {
                    Text(headingEN)
                        .modifier(HeadingModifier())
                }
                else if languageDB[0].language == "KZ" {
                    Text(headingKZ)
                        .modifier(HeadingModifier())
                }
                ScrollView (.vertical) {
                    VStack {
                        if languageDB[0].language == "RU" {
                            Text(textRU)
                        }
                        else if languageDB[0].language == "EN" {
                            Text(textEN)
                        }
                        else if languageDB[0].language == "KZ" {
                            Text(textKZ)
                        }
                    }.padding(.top, 15)
                }
                .frame(width: 360)
                .cornerRadius(10)
            }
        }.navigationBarBackButtonHidden()
    }
}

struct TipView_Previews: PreviewProvider {
    static var previews: some View {
        TipView(imagePNG: "TipWaterPNG", textRU: "Молодые растения первым делом поливают при посадке. Далее саженцам нужна влага, чтобы они быстрее приживались, развивались и готовились к формированию плодов. Плодоносящий сад также требует полива – для формирования качественного урожая. \n Когда проводить первый полив садовых культур? \n Обычно за летний сезон деревья в саду достаточно полить 2-3 раза, а при засушливой погоде – 3-4 раза. При этом экземпляры, которые только были посажены, для лучшей приживаемости рекомендуется поливать по 2-3 раза в месяц. Первый полив проводят в конце мая – первой половине июня в зависимости от культуры. \n Норма полива плодовых деревьев. \n При поливе деревьев норма воды меняется в зависимости от возраста культуры: \n саженец – 30-50 л воды; \n 3-5-летние деревья – 50-80 л; \n 7-12-летние – 120-150 л; \n более взрослые – 30-50 л на 1 кв.м приствольного круга. \n Основные способы полива сада \n Поверхностный полив \n Этот вид подразумевает полив в приствольные круги. Для его проведения под деревьями нужно организовать углубления с бортиками, чтобы получилась так называемая 'чаша'. Диаметр приствольного круга должен равняться диаметру кроны, поэтому с каждым годом он может изменяться. \n Можно поливать деревья и в борозды. Этот способ подходит для ровного участка, на котором все деревья растут рядом. Для этого в междурядьях следует нарезать борозды шириной до 30 см, в которые при поливе из шланга можно подавать воду. После того, как вода впитается, борозды необходимо засыпать. ", textEN: "hello", textKZ: "hello", headingRU: "Как поливать дерево?", headingEN: "IM TIRED", headingKZ: "NE ZNAU")
    }
}
