//
//  AppDelegate.swift
//  JJApp
//
//  Created by Arnella Tolegen on 01.08.2023.
//


//import UIKit
//import CoreData
//
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    var window: UIWindow?
//
//    lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "LanguageDB")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//            // Set the uncaught exception handler
//            prepopulateDataIfNeeded()
//            return true
//        }
//
//    func restartApp() {
//            guard let window = self.window else { return }
//
//            // Pause the app for a short duration to allow the restart process
//            // Sleep for 2 seconds (adjust the duration as needed)
//            Thread.sleep(forTimeInterval: 2.0)
//
//            // Get the root view controller
//            if let rootViewController = window.rootViewController {
//                // Create a new instance of the root view controller
//                let storyboard = UIStoryboard(name: "Main.storyboard", bundle: nil) // Replace "Main" with your storyboard name
//                let newRootViewController = storyboard.instantiateViewController(withIdentifier: rootViewController.restorationIdentifier!)
//
//                // Transition to the new root view controller with a cross-dissolve animation
//                UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
//                    window.rootViewController = newRootViewController
//                }, completion: nil)
//            }
//        }
//
//    func prepopulateDataIfNeeded() {
//        let hasPrepopulatedKey = "hasPrepopulatedData"
//
//        if !UserDefaults.standard.bool(forKey: hasPrepopulatedKey) {
//            let context = persistentContainer.viewContext
//
//            let language1 = LanguageDB(context: context)
//            language1.language = "KZ"
//
//            do {
//                try context.save()
//                UserDefaults.standard.set(true, forKey: hasPrepopulatedKey)
//
//            } catch {
//                print("Error saving context: \(error)")
//            }
//        }
//    }
//
//}
