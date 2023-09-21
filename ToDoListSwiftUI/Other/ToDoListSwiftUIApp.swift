//
//  ToDoListSwiftUIApp.swift
//  ToDoListSwiftUI
//
//  Created by Nishant Minerva on 20/09/23.
//

import SwiftUI
import UIKit
import FirebaseCore

class AppDelegate: NSObject,  UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
 
@main
struct ToDoListSwiftUIApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    init() {}
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
