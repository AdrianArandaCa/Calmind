//
//  MeditationView.swift
//  Calmind
//
//  Created by Adrian Aranda Campanario on 21/7/24.
//

import SwiftUI

struct MeditationView: View {
    
    @State var showPlayer: Bool = false
    @State var audioManagerViewModel: AudioManagerViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 0) {
                    ZStack(alignment: .top){
                        Image(audioManagerViewModel.selectedSong?.image ?? "music")
                            .resizable()
                            .scaledToFill()
                            .frame(height: geometry.size.height / 4)
                    }
                    
                    
                    ZStack {
                        Color(red: 24/255, green: 23/255, blue: 22/255)
                        
                        VStack(alignment: .leading, spacing: 24, content: {
                            HStack(alignment: .center, spacing: 8, content: {
                                Text("\(audioManagerViewModel.selectedSong?.name ?? "No name")")
                                Text(String(format:"%.2f s",audioManagerViewModel.selectedSong?.time.doubleValue ?? 0))
                            })
                            .font(.subheadline)
                            .textCase(.uppercase)
                            .opacity(0.7)
                            Text(audioManagerViewModel.selectedSong?.name ?? "No name")
                                .font(.title)
                            Text(audioManagerViewModel.selectedSong?.description ?? "No description")
                            HStack(alignment: .center, spacing: 10, content: {
                                Image(systemName: "heart.fill")
                                Text(String(format: "%d k Liked",audioManagerViewModel.selectedSong?.liked.intValue ?? 0))
                                
                                Image(systemName: "airpods")
                                Text(String(format: "%d k Listening", audioManagerViewModel.selectedSong?.listenings.intValue ?? 0))
                            })
                            Divider()
                            Text("Related")
                                .font(.title3)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    if let relateds = audioManagerViewModel.selectedSong?.relateds {
                                        ForEach(relateds, id:\.id) { item in
                                            VStack(alignment: .leading, spacing: 10) {
                                                Image(item.image)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 180)
                                                
                                                Text(item.name)
                                                    .font(.headline)
                                                
                                                HStack {
                                                    Text("\(item.time)")
                                                        .font(.caption)
                                                    Text(item.category.uppercased())
                                                        .font(.caption)
                                                }
                                            }
                                        }
                                    } else {
                                        ForEach(demoRelated1, id:\.id) { item in
                                            VStack(alignment: .leading, spacing: 10) {
                                                Image(item.image)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 100, height: 100)
                                                
                                                Text(item.name)
                                                    .font(.headline)
                                                
                                                HStack {
                                                    Text("\(item.time) min")
                                                        .font(.caption)
                                                    Text(item.category.uppercased())
                                                        .font(.caption)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            Spacer()
                        })
                        .padding()
                        .foregroundStyle(.white)
                        
                        VStack {
                            Spacer()
                            
                            Button {
                                showPlayer.toggle()
                            } label: {
                                Label("Play", systemImage: "play.fill")
                                    .font(.headline)
                                    .foregroundStyle(.black)
                                    .padding(.vertical, 15)
                                    .frame(maxWidth: geometry.size.width)
                                    .background(.white)
                                    .clipShape(Capsule())
                                    .padding()
                                    .padding(.bottom)
                            }
                            .fullScreenCover(isPresented: $showPlayer, content: {
                                PlayerView(audioManagerViewModel: audioManagerViewModel, isPreview: true)
                            })

                        }
                    }
                }
                VStack {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundStyle(.black)
                                .padding()
                                .background(.white.opacity(0.5))
                                .clipShape(Circle())
                        }
                        .padding()
                        Spacer()
                    }
                    .padding()
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    MeditationView(audioManagerViewModel: AudioManagerViewModel())
}
