//
//  CalmindApp.swift
//  Calmind
//
//  Created by Adrian Aranda Campanario on 21/7/24.
//

import SwiftUI

@main
struct CalmindApp: App {
    @StateObject var audioManagerViewModel = AudioManagerViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManagerViewModel)
        }
    }
}
