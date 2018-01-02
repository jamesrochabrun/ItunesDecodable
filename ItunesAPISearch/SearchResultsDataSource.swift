//
//  SearchResultsDataSource.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 4/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class SearchResultsDataSource: NSObject, UITableViewDataSource {
    
    fileprivate var data = [Artist]()
    override init() {
        super.init()
    }
    
    //this acts as the updater after the search
    func update(with artists: [Artist]) {
        data = artists
    }
    
    //MAR: - Datasource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let artist = getArtist(from: indexPath)
        cell.textLabel?.text = artist.artistName
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}

//MARK: - helper methods
extension SearchResultsDataSource {
    
    func getArtist(from indexpath:IndexPath) -> Artist {
        return data[indexpath.row]
    }
}





