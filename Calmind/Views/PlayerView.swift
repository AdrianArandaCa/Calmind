//
//  PlayerView.swift
//  Calmind
//
//  Created by Adrian Aranda Campanario on 21/7/24.
//

import SwiftUI

struct PlayerView: View {
    
    @State private var value: Double = 0.0
    @EnvironmentObject var audioManagerViewModel: AudioManagerViewModel
    @Environment(\.dismiss) var dismiss
    var isPreview: Bool = false
    
    var timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            Image("music")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                HStack {
                    Button {
                        do {
                            try audioManagerViewModel.playPause(dismiss: true)
                        } catch let error{
                            print("\(error.localizedDescription)")
                        }
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.black)
                            .padding()
                            .background(.white.opacity(0.5))
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    Button {
                        //TODO:
                    } label: {
                        Image(systemName: "heart")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.black.opacity(0.5))
                            .clipShape(Circle())
                    }
                    
                    Button {
                        //TODO:
                    } label: {
                        Image(systemName: "square.and.arrow.down")
                            .foregroundStyle(.black)
                            .padding()
                            .background(.white.opacity(0.5))
                            .clipShape(Circle())
                    }
                }
                .padding()
                
                Spacer()
                
                Text("Night Island")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Sleep Music".uppercased())
                    .opacity(0.5)
                
                HStack(spacing: 20) {
                    
                    Button {
                        audioManagerViewModel.player?.currentTime -= 15
                    } label: {
                        Image(systemName: "gobackward.15")
                            .font(.title3)
                    }
                    
                    Button {
                        do {
                            try audioManagerViewModel.playPause()
                        } catch let error {
                            print("\(error.localizedDescription)")
                        }
                    } label: {
                        Image(systemName: audioManagerViewModel.player?.isPlaying ?? false ? "pause.fill" : "play.fill")
                        .font(.title)
                        .foregroundStyle(.black)
                        .padding(30)
                        .background(.white)
                        .clipShape(Circle())
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Circle())
                    }
                    
                    Button {
                        audioManagerViewModel.player?.currentTime += 15
                    } label: {
                        Image(systemName: "goforward.15")
                            .font(.title3)
                    }
                }
                
                VStack(spacing: 5, content: {
                    Slider(value: $value, in: 0...Double(audioManagerViewModel.player?.duration ?? 0))
                           { editing in
                        print("editing", editing)
                        if !editing {
                            audioManagerViewModel.player?.currentTime = value
                        }
                    }
                    .accentColor(.white)
                })
                
                HStack {
                    Text("\(DateComponentsFormatter.positional.string(from: Double(audioManagerViewModel.player?.currentTime ?? 0)) ?? "0:00")")
                    Spacer()
                    Text("\(DateComponentsFormatter.positional.string(from: Double(audioManagerViewModel.player?.duration ?? 0)) ?? "0:00")")
                }
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.height / 12)
            }
            .foregroundStyle(.white)
            .padding()
        }
        .ignoresSafeArea()
        .onAppear() {
            do {
                try audioManagerViewModel.startPlayer(track: audioManagerViewModel.selectedSong?.music ?? "relaxed_music", isPreview: isPreview)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        .onReceive(timer) { _ in
            guard let player = audioManagerViewModel.player else { return }
            value = player.currentTime
        }
    }
}

#Preview {
    PlayerView(isPreview: true)
        .environmentObject(AudioManagerViewModel())
}
