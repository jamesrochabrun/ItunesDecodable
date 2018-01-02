//
//  PendingOperations.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 5/1/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation

//Object that keeps track of what operations are not needed
class PendingOperations {
    
    var downloadsInProgress = [IndexPath: Operation]()
    let downloadQueue = OperationQueue()
}
