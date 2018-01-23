//
//  RoutingReducer.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 1/22/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import ReSwift

func routingReducer(action: Action, state: RoutingState?) -> RoutingState {
    var state = state ?? RoutingState()
    switch action {
    case let routingAction as RoutingAction:
        state.navigationState = routingAction.destination
        state.modally = routingAction.modally ?? false
    default: break
    }
    return state
}
