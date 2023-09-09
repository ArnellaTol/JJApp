//
//  ActionPicker.swift
//  JJApp
//
//  Created by Arnella Tolegen on 27.05.2023.
//

import SwiftUI

struct ActionPicker: View {
//    @FetchRequest(sortDescriptors: []) var languageDB: FetchedResults<LanguageDB>
//    @Environment(\.managedObjectContext) var moc
//    var statusRU: [String] = ["Поливка дерева", "Разрыхление дерева", "Побелка дерева", "Удобрение дерева"]
//    var statusEN: [String] = ["Watering the tree", "Loosening the tree", "Whitewashing the tree", "Fertilizing the tree"]
//    var statusKZ: [String] = ["Ағашты суару", "Ағашты қопсыту", "Ағашты ағарту", "Ағашты ұрықтандыру"]
//    @State var indexStatus: Int = 0
    
//    var currentStatusRU: String = ""
//    var currentStatusEN: String = ""
//    var currentStatusKZ: String = ""
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(colors: [ Color(red: 0.478, green: 0.664, blue: 0.282), Color(red: 0.062, green: 0.414, blue: 0.23)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
                .frame(width: 300, height: 40)
    
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .frame(width: 298, height: 38)
            
        }
    }
//    public func getActionEN()->Int{
//        return indexStatus
//    }
}

struct ActionPicker_Previews: PreviewProvider {
    static var previews: some View {
        ActionPicker()
    }
}
