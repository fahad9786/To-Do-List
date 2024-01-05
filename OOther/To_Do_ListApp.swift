//
//  To_Do_ListApp.swift
//  To Do List
//
//  Created by Fahad Sheikh on 2023-10-26.
//
import FirebaseCore
import SwiftUI

@main
struct To_Do_ListApp: App {
    // configures the app so it wont crash
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
