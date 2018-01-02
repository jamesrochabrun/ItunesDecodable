//
//  AlbumDetailViewModel.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 4/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation

struct AlbumDetailViewModel {
    
    let title: String
    let genre: String
}

extension AlbumDetailViewModel {
    
    init(album: Album) {
        self.title = album.collectionCensoredName ?? ""
        self.genre = album.primaryGenreName ?? ""
    }
}
