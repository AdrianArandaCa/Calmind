//
//  AudioManager.swift
//  Calmind
//
//  Created by Adrian Aranda Campanario on 22/7/24.
//

import Foundation
import AVKit

enum CustomError: Error {
    case errorURL
    case errorInitialize
    case errorPlayerNotFound
}

final class AudioManagerViewModel: ObservableObject {
    
    var player : AVAudioPlayer?
    
    func startPlayer(track: String, isPreview: Bool = false) throws {
        guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else {
            throw CustomError.errorURL
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
            if !isPreview {
                player?.prepareToPlay()
            } else {
                player?.play()
            }
        } catch {
            print("Fail to initialize player", error)
            throw CustomError.errorInitialize
        }
    }
    
    func playPause() throws {
        guard let player = player else {
            print("Instance of audio player not found")
            throw CustomError.errorPlayerNotFound
        }
        
        if player.isPlaying {
            player.pause()
        } else {
            player.play()
        }
    }
}
