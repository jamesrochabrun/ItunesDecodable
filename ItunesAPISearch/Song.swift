//
//  Song.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 4/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation

struct SongsResult: Codable {
    let results: [Song?]?
}

class Song: Codable {
    
    let trackId: Int?
    let trackName: String?
    let trackCensoredName: String?
    let trackTimeMillis: Int?
    let trackExplicitness: String?
    let collectionName: String?
    
//        enum CodingKeys: String, CodingKey {
//            case trackId = "id"
//            case trackName = "songName"
//            case trackCensoredName = "songCensoredName"
//            case trackTimeMillis = "trackTime"
//            case trackExplicitness = "isExplicit"
//            case collectionName = "albumName"
//        }
}

//extension Song {
//
//    init?(json: [String: Any]) {
//
//        struct Key {
//            static let id = "trackId"
//            static let name = "trackName"
//            static let censoredName = "trackCensoredName"
//            static let trackTime = "trackTimeMillis"
//            static let isExplicit = "trackExplicitness"
//        }
//
//        guard let idValue = json[Key.id] as? Int,
//            let nameValue = json[Key.name] as? String,
//            let censoredNameValue = json[Key.censoredName] as? String,
//            let trackTimeValue = json[Key.trackTime] as? Int,
//            let isExplicitString = json[Key.isExplicit] as? String else {
//                return nil
//        }
//
//        self.id = idValue
//        self.name = nameValue
//        self.censoredName = censoredNameValue
//        self.trackTime = trackTimeValue
//        self.isExplicit = isExplicitString == "notExplicit" ? false : true
//    }
//}

