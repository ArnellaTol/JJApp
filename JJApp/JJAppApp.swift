//
//  JJAppApp.swift
//  JJApp
//
//  Created by Arnella Tolegen on 25.01.2023.
//

import SwiftUI

@main
struct JJAppApp: App {
    @StateObject private var dataController = DataBaseController()
    
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            LogInView()
                .environment(\.managedObjectContext, dataController.container.viewContext)

        }
    }
}
