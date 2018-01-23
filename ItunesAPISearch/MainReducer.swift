//
//  MainReducer.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 1/22/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(routingState: routingReducer(action: action, state: state?.routingState))
}
