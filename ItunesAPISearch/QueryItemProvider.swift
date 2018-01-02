//
//  File.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 4/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation

//conforming types of this prootcol must provide a queryItem
protocol QueryItemProvider {
    
    var queryItem: URLQueryItem { get }
}
