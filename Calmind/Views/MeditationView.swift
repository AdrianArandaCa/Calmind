//
//  MeditationView.swift
//  Calmind
//
//  Created by Adrian Aranda Campanario on 21/7/24.
//

import SwiftUI

struct MeditationView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("music")
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height/3)
            
            
            ZStack {
                Color(red: 24/255, green: 23/255, blue: 22/255)
                
                VStack(alignment: .leading, spacing: 24, content: {
                    HStack(alignment: .center, spacing: 8, content: {
                        Text("Music")
                        Text("0s")
                    })
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    Text("Night Island")
                        .font(.title)
                    Text("Ease the mind into a restful night's sleet with these deep, amblent tones. ")
                    HStack(alignment: .center, spacing: 10, content: {
                        Image(systemName: "heart.fill")
                        Text("24k Liked")
                        
                        Image(systemName: "airpods")
                        Text("34k Listening")
                    })
                    Divider()
                    Text("Related")
                        .font(.title3)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(demoRelated, id:\.id) { item in
                                VStack(alignment: .leading, spacing: 10) {
                                    Image(item.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 180)
                                    
                                    Text(item.name)
                                        .font(.headline)
                                    
                                    HStack {
                                        Text(item.time)
                                            .font(.caption)
                                        Text(item.category.uppercased())
                                            .font(.caption)
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
                        
                    } label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .padding(.vertical, 15)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .clipShape(Capsule())
                            .padding()
                            .padding(.bottom)
                    }

                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MeditationView()
}

struct RelatedModel: Identifiable {
    var id: UUID = .init()
    var image: String
    var name: String
    var time: String
    var category: String
}

var demoRelated: [RelatedModel] = [
    RelatedModel(image: "moon", name: "Moon Clouds", time: "45min", category: "Sleep Music"),
    RelatedModel(image: "sweet_sleep", name: "Sweet Sleep", time: "45min", category: "Sleep Music")
]
