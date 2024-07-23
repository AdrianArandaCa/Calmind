//
//  ListMeditationView.swift
//  Calmind
//
//  Created by Adrian Aranda Campanario on 23/7/24.
//

import SwiftUI

struct ListMeditationView: View {
    @EnvironmentObject var audioManagerViewModel: AudioManagerViewModel
    @State private var showMeditationView: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(demoSongs, id:\.id) { song in
                    Button {
                        audioManagerViewModel.selectedSong = song
                        showMeditationView = true
                    } label: {
                        HStack {
                            Image(song.image)
                                .resizable()
                                .frame(width: 40, height: 40)
                            VStack {
                                Text("\(song.name)")
                                Text("\(song.category)")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Meditation Songs")
            .fullScreenCover(isPresented: $showMeditationView) {
                MeditationView()
                    .environmentObject(audioManagerViewModel)
            }
        }
    }
}

#Preview {
    ListMeditationView()
        .environmentObject(AudioManagerViewModel())
}
