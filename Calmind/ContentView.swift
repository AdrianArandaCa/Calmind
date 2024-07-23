//
//  ContentView.swift
//  Calmind
//
//  Created by Adrian Aranda Campanario on 21/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var audioManagerViewModel: AudioManagerViewModel = .init()
    var body: some View {
        ListMeditationView(audioManagerViewModel: audioManagerViewModel)
    }
}

#Preview {
    ContentView(audioManagerViewModel: AudioManagerViewModel())
}
