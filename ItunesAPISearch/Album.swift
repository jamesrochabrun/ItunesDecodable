//
//  Album.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 4/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

//modeling the state of the artwork download
enum AlbumArtworkState: Int, Codable {
    
    case placeholder
    case downloaded
    case failed
}

struct AlbumsResult: Codable {
    let results: [Album?]?
}

class Album: Codable {
    
    let artistId: Int?
    let collectionId: Int?
    let artistName: String?
    let collectionName: String?
    let collectionCensoredName: String?
    let artworkUrl100: String?
    let collectionExplicitness: String?
    let numberOfTracks: Int?
    let releaseDate: String?
    var artworkState: AlbumArtworkState?
    let primaryGenreName: String?
    var songs: [Song]?
    var imageData: Data?
    
    //var artwork: UIImage?
  //  var artworkState = AlbumArtworkState.placeholder
    
//    init(id: Int, artistName: String, name: String, censoredName: String, artWorkURL: String, isExplicit: Bool, numberOfTracks: Int,  releaseDate: Date, primaryGenre: Genre) {
//        self.id = id
//        self.artistName = artistName
//        self.name = name
//        self.censoredName = censoredName
//        self.artWorkURL = artWorkURL
//        self.isExplicit = isExplicit
//        self.numberOfTracks = numberOfTracks
//        self.releaseDate = releaseDate
//        self.primaryGenre = primaryGenre
//    }
}


//extension Album {
//    convenience init?(json: [String: Any]) {
//
//        struct Key {
//            static let id = "collectionId"
//            static let artistName = "artistName"
//            static let name = "collectionName"
//            static let censoredName = "collectionCensoredName"
//            static let artworkUrl = "artworkUrl100"
//            static let collectionExplicitness = "collectionExplicitness"
//            static let trackCount = "trackCount"
//            static let releaseDate = "releaseDate"
//            static let primaryGenre = "primaryGenreName"
//        }
//
//        let formatter = DateFormatter()
//        formatter.locale = Locale(identifier: "en_US_POSIX")
//        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
//
//        guard let idValue = json[Key.id] as? Int,
//            let artistNameValue = json[Key.artistName] as? String,
//            let nameValue = json[Key.name] as? String,
//            let censoredNameValue = json[Key.censoredName] as? String,
//            let artworkUrlString = json[Key.artworkUrl] as? String,
//            let isExplicitValue = json[Key.collectionExplicitness] as? String,
//            let numberOfTracksValue = json[Key.trackCount] as? Int,
//            let releaseDateString = json[Key.releaseDate] as? String,
//            let releaseDateValue = formatter.date(from: releaseDateString),
//            let primaryGenreString = json[Key.primaryGenre] as? String,
//            let primaryGenreValue = Genre(name: primaryGenreString) else { return nil }
//
//        let isExplicit = isExplicitValue == "notExplicit" ? false : true
//
//        self.init(id: idValue, artistName: artistNameValue, name: nameValue, censoredName: censoredNameValue, artWorkURL: artworkUrlString, isExplicit: isExplicit, numberOfTracks: numberOfTracksValue, releaseDate: releaseDateValue, primaryGenre: primaryGenreValue)
//    }
//}

