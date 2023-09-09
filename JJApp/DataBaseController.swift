//
//  DataBaseController.swift
//  JJApp
//
//  Created by Arnella Tolegen on 27.05.2023.
//

import Foundation
import CoreData

class DataBaseController: ObservableObject {
    let container = NSPersistentContainer(name: "LanguageDB")
    
    init() {
        container.loadPersistentStores { descripton, error in
            if let error = error {
                print("Core data is failed: \(error.localizedDescription)")
            }
            
        }
    }
}
