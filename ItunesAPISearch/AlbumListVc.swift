//
//  AlbumListVc.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 4/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class AlbumListVC: UITableViewController {
    
    fileprivate struct Constants {
        static let AlbumCellHeight: CGFloat = 80
    }
    let client = ItunesAPIClient()
    var artist: Artist? {
        didSet {
            self.title = artist?.artistName
        }
    }
    //MARK: HERE IS HOW INITIALIZE DATSOURCE!
    lazy var dataSource: AlbumListDataSource = {
        return AlbumListDataSource(albums: [], tableView: self.tableView)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let albums = artist?.albums {
            dataSource.update(with: albums)
            tableView.reloadData()
        }
        setUpViews()
    }
    
    private func setUpViews() {
        tableView.register(AlbumCell.self)
        tableView.dataSource = dataSource
    }    
}

//MARK: - Delegate methods
extension AlbumListVC {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.AlbumCellHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedAlbum = dataSource.getAlbum(from: indexPath)
        guard let albumID = selectedAlbum.collectionId else { return }

        client.lookUpsongsFromAlbum(with: albumID).then
            { songsResult in
            self.update(album: selectedAlbum, with: songsResult)
            }.catch { error in
                print(error)
        }
    }

    private func update(album: Album, with songsResult: SongsResult?) {
        guard let songsResult = songsResult else { return }
        let albumDetailVC = AlbumDetailVC(style: .grouped)
        if let results = songsResult.results {
            let songs = results.flatMap { return $0 }
            album.songs = songs
            albumDetailVC.album = album
            self.navigationController?.pushViewController(albumDetailVC, animated: true)
        }
    }
    
    
    //MARK: INVESTIGATE MORE
//    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        
//        if let operation = dataSource.pendingOperations.downloadsInProgress[indexPath] {
//            print("name: ", operation)
//            operation.cancel()
//            dataSource.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
//        }
//    }
}













