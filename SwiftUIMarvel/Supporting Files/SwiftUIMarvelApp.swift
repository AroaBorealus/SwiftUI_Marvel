//
//  SwiftUIMarvelApp.swift
//  SwiftUIMarvel
//
//  Created by Aroa Miguel Garcia on 16/12/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftUIMarvelApp: App {
    @State var AppState = AppStateVM()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(AppState)
        }
    }
}
