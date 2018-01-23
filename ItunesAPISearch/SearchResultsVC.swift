//
//  SearchResultsController.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 4/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit
import PromiseKit

class SearchResultsVC: UITableViewController {
    
    // MARK: - Properties
    private let searchController = UISearchController(searchResultsController: nil)
    private let dataSource = SearchResultsDataSource()
    private let client = ItunesAPIClient()
    
    // MARK: - App Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(SearchResultsVC.dismissVC))
        setUpViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // add store subscribers here
        self.updateNavigationState()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // unsuscribe here
    }
    
    // MARK: - Set up UI
    private func setUpViews() {
        tableView.register(UITableViewCell.self)
        tableView.dataSource = dataSource
        tableView.tableHeaderView = searchController.searchBar
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        ///this hides the searchbar in the next vc
        definesPresentationContext = true
    }
    
    // MARK: - Navigation
    @objc func dismissVC() {
        self.dismiss(animated: true)
    }
    
    private func updateNavigationState() {
        store.dispatch(RoutingAction(destination: .search, modally: nil))
    }
}

//MARK: Search updates protocol "delegate" gets triggered every time 
extension SearchResultsVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        ///  test : dataSource.update(with: [Stub.artist])
        guard let searchText = searchController.searchBar.text else { return }

        client.searchForArtists(withTerm: searchText).then
            { artistsResult in
            self.updateWith(artistsResult: artistsResult)
            }.catch { error in
                print(error)
        }
    }
    
    private func updateWith(artistsResult: ArtistsResult?) {
        guard let artistsResult = artistsResult,
        let results = artistsResult.results
        else { return }
        let artists = results.flatMap { return $0 }
        self.dataSource.update(with: artists)
        self.tableView.reloadData()
    }
}

//MARK: Delegate tableview methods
extension SearchResultsVC {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedArtist = dataSource.getArtist(from: indexPath)
        guard let artistID = selectedArtist.artistId else { return }

        client.lookUpAlbumsFromArtist(with: artistID).then
            { albumsResult in
            self.update(artist: selectedArtist, with: albumsResult)
            }.catch { error in
                print(error)
        }
    }
    
    private func update(artist: Artist, with albumsResult: AlbumsResult?)  {
        guard let albumsResult = albumsResult else { return  }
        store.dispatch(RoutingAction(destination: .albumList, modally: false))
        /// HERE GOES A NEW STATE
//        let albumListVC = AlbumListVC()
//        if let results = albumsResult.results {
//            let albums = results.flatMap { return $0 }
//            artist.albums = albums
//            albumListVC.artist = artist
//            self.navigationController?.pushViewController(albumListVC, animated: true)
//        }
    }
}









