//
//  ContentView.swift
//  Calmind
//
//  Created by Adrian Aranda Campanario on 21/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var audioManagerViewModel: AudioManagerViewModel
    var body: some View {
        MeditationView()
            .environmentObject(audioManagerViewModel)
    }
}

#Preview {
    ContentView()
        .environmentObject(AudioManagerViewModel())
}
