//
//  Artist.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 4/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation

struct ArtistsResult: Codable {
    let results: [Artist?]?
}

class Artist: Codable {
    
    let artistId: Int?
    let artistName: String?
  //  let primaryGenre: Genre?
    var albums: [Album]?
    
//    init(id: Int, name: String, primaryGenre: Genre, albums: [Album]) {//designated initializer
//
//        self.id = id
//        self.name = name
//        self.primaryGenre = primaryGenre
//        self.albums = albums
//    }
}

//extension Artist {
//
//    convenience init?(json: [String: Any]) {
//
//        struct Key {
//            static let artistName = "artistName"
//            static let artistId = "artistId"
//            static let primaryGenreId = "primaryGenreId"
//        }
//
//        guard let artistName = json[Key.artistName] as? String,
//            let artistId = json[Key.artistId] as? Int,
//            let primaryGenreId = json[Key.primaryGenreId] as? Int,
//            let primaryGenreValue = Genre(rawValue: primaryGenreId) else {
//                return nil
//        }
//
//        self.init(id: artistId, name: artistName, primaryGenre: primaryGenreValue, albums: [])
//    }
//}






