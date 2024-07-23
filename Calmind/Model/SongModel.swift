//
//  SongModel.swift
//  Calmind
//
//  Created by Adrian Aranda Campanario on 23/7/24.
//

import Foundation
struct SongModel: Identifiable {
    var id: UUID = .init()
    var image: String
    var name: String
    var description: String?
    var liked: NSNumber
    var listenings: NSNumber
    var time: NSNumber
    var category: String
    var music: String
    var relateds = [SongModel]()
}

var demoSongs: [SongModel] = [
    SongModel(image: "music", name: "Night Island",description: "Ease the mind into a restful night's sleet with these deep, amblent tones", liked: 33, listenings: 44, time: 4, category: "Night Music",music: "relaxed_music", relateds: demoRelated1),
    SongModel(image: "moon", name: "Moon Clouds",description: "Ease the mind into a restful night's sleet with these deep, amblent tones", liked: 11, listenings: 18, time: 3, category: "Moon Music", music: "relaxed_music",relateds: demoRelated2),
    SongModel(image: "sweet_sleep", name: "Sweet Sleep",description: "Ease the mind into a restful night's sleet with these deep, amblent tones", liked: 22, listenings: 38, time: 6, category: "Sweet Music", music: "relaxed_music",relateds: demoRelated3)
]

var demoRelated1: [SongModel] = [
    SongModel(image: "moon", name: "Moon Clouds",description: "Ease the mind into a restful night's sleet with these deep, amblent tones", liked: 11, listenings: 18, time: 3, category: "Moon Music", music: "relaxed_music",relateds: []),
    SongModel(image: "sweet_sleep", name: "Sweet Sleep",description: "Ease the mind into a restful night's sleet with these deep, amblent tones", liked: 22, listenings: 38, time: 6, category: "Sweet Music", music: "relaxed_music",relateds: [])
]

var demoRelated2: [SongModel] = [
    SongModel(image: "music", name: "Night Island",description: "Ease the mind into a restful night's sleet with these deep, amblent tones", liked: 33, listenings: 44, time: 4, category: "Night Music", music: "relaxed_music",relateds: []),
    SongModel(image: "sweet_sleep", name: "Sweet Sleep",description: "Ease the mind into a restful night's sleet with these deep, amblent tones", liked: 22, listenings: 38, time: 6, category: "Sweet Music", music: "relaxed_music",relateds: [])
]

var demoRelated3: [SongModel] = [
    SongModel(image: "music", name: "Night Island",description: "Ease the mind into a restful night's sleet with these deep, amblent tones", liked: 33, listenings: 44, time: 4, category: "Night Music", music: "relaxed_music",relateds: []),
    SongModel(image: "moon", name: "Moon Clouds",description: "Ease the mind into a restful night's sleet with these deep, amblent tones", liked: 11, listenings: 18, time: 3, category: "Moon Music", music: "relaxed_music",relateds: [])
]
