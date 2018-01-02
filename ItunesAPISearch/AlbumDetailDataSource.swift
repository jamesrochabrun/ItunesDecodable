//
//  AlbumDetailDataSource.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 4/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class AlbumDetailDataSource: NSObject, UITableViewDataSource {
    
    fileprivate var songs: [Song]
    
    init(songs: [Song]) {
        self.songs = songs
        super.init()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SongCell
        let song = getSong(from: indexPath)
        let viewModel = SongViewModel(song: song)
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 0 : songs.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? nil : "Tracks"
    }
}

//MARK: - Helper methods
extension AlbumDetailDataSource {
    
    func getSong(from indexPath: IndexPath) -> Song {
        return songs[indexPath.row]
    }
    
    func update(with songs: [Song]) {
        self.songs = songs
    }
    
}
