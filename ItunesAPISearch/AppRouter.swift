//
//  AppRouter.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 1/22/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit
import ReSwift

/// Helper enum to hold destination on the app
enum RoutingDestination {
    
    case welcome
    case search
    case albumList
    case albumDetail
    case preview
    
    var destinationVC: UIViewController.Type {
        switch self {
        case .welcome: return WelcomeVC.self
        case .search: return SearchResultsVC.self
        case .albumList: return AlbumListVC.self
        case .albumDetail: return AlbumDetailVC.self
        case .preview: return PreviewVC.self
        }
    }
}

final class AppRouter {
    
    let navigationController: UINavigationController
    
    init(window: UIWindow) {
        navigationController = UINavigationController()
        window.rootViewController = navigationController
        store.subscribe(self) { subscriptor in
            subscriptor.select { state in
                state.routingState
            }
        }
    }
    
    fileprivate func showViewController<T: UIViewController>(_ controller: T.Type, animated: Bool, modally: Bool? = false) {
        let vc = controller.init()
        
        /// this is the most important to avoid weird states on the navigation
        let newViewControllerType = type(of: vc)
        if let currentVc = navigationController.topViewController {
            let currentViewControllerType = type(of: currentVc)
            if currentViewControllerType == newViewControllerType {
                return
            }
        }
        navigationController.pushViewController(vc, animated: animated)
        /// Fix this FOR MODAL controllers
//        if let modally = modally, modally {
//            navigationController.present(vc, animated: animated)
//        } else {
//            navigationController.pushViewController(vc, animated: animated)
//        }
    }
}

extension AppRouter: StoreSubscriber {
    
    func newState(state: RoutingState) {
        let shouldAnimate = navigationController.topViewController != nil
        showViewController(state.navigationState.destinationVC, animated: shouldAnimate, modally: state.modally)
    }
}























