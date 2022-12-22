//
//  TriviaGameApp.swift
//  TriviaGame
//
//  Created by Szymon Kocowski on 20/12/22.
//

import SwiftUI

@main
struct TriviaGameDemoApp: App {
    
    @StateObject var tm = TriviaManager()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(tm)
        }
    }
}
