//
//  RoutingState.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 1/22/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import ReSwift

struct RoutingState: StateType {
    
    var navigationState: RoutingDestination
    
    init(navigationState: RoutingDestination = .welcome) {
        self.navigationState = navigationState
    }
}
