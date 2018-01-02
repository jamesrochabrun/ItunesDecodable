//
//  SongViewModel.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 4/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation

struct SongViewModel {
    let title: String
    let duration: String
}

extension SongViewModel {
    
    init(song: Song) {
        
        self.title = song.trackCensoredName ?? song.collectionName ?? "No name provided for this album"
        //track in miliseconds
        if let trackTime = song.trackTimeMillis {
            let timeInSeconds = trackTime / 1000
            let minutes = timeInSeconds / 60 % 60
            let seconds = timeInSeconds % 60
            self.duration = "\(minutes): \(seconds)"
        } else {
            self.duration = "ALBUM"
        }
    }
}
