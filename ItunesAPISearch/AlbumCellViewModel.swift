//
//  AlbumCellViewModel.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 4/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

struct AlbumCellViewModel {
    
    let title: String
    var genre: Genre?
    let artwork: UIImage
}

extension AlbumCellViewModel {
    
    init(album: Album) {

        if album.artworkState == .downloaded {
            
            if let imageData = album.imageData,
                /// this process should be done on background thread, needs to be fixed
                let artwork = UIImage(data: imageData) {
                self.artwork = artwork
            } else {
                self.artwork = #imageLiteral(resourceName: "albumPlaceholder")
            }
        } else {
            self.artwork = #imageLiteral(resourceName: "albumPlaceholder")
        }
        
        if let censoredName = album.collectionCensoredName {
            self.title = censoredName
        } else {
            self.title = album.artistName ?? "No name for this artist"
        }
        if let genreName = album.primaryGenreName, let genre = Genre(name: genreName) {
            self.genre = genre
        }
    }
}
