//
//  ProjectApp.swift
//  Project
//
//  Created by Randy on 20/06/22.
//

import SwiftUI
import FirebaseCore

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        InsertPin.authenticatePin.savePin(pin: "123456")
        return true
    }
}

@main
struct ProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
            // Transfer()
        }
    }
}
