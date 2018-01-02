//
//  Swipeable.swift
//  ItunesAPISearch
//
//  Created by james rochabrun on 12/15/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

//MARK: 1 protocol
protocol TinderSwipeable { }

//MARK: 2 Creating a protocol constrain
extension TinderSwipeable where Self: UIPanGestureRecognizer {
    
    //MARK 3 Main function
    func swipeView(_ view: UIView) -> (alpha: CGFloat, pointX: CGFloat) {
        var tupleAlphaX: (alpha: CGFloat, pointX: CGFloat) = (alpha: 0, pointX: 0)
        switch state {
        case .changed:
            let translation = self.translation(in: view.superview)
            view.transform = transform(view: view, for: translation)
            tupleAlphaX = self.getAlphaAndPointX(for: translation, in: view)
        case .ended:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: [], animations: {
                view.transform = .identity
                tupleAlphaX = (alpha: 1, pointX: tupleAlphaX.pointX)
            }, completion: nil)
        default:
            break
        }
        return tupleAlphaX
    }
    
    /// alpha value an x coordinate
    private func getAlphaAndPointX(for translation: CGPoint, in view: UIView) -> (alpha: CGFloat, pointX: CGFloat) {
        let x = fabs(translation.x)
        let proportion = x / view.frame.size.width
        let newAlpha = 1 - proportion
        return (alpha: newAlpha, pointX: view.transform.tx)
    }
    
    /// MARK: 4 Helper method that handles transformation
    private func transform(view: UIView, for translation: CGPoint) -> CGAffineTransform {
        let moveBy = CGAffineTransform(translationX: translation.x, y: translation.y)
        let rotation = -sin(translation.x / (view.frame.width * 4.0))
        return moveBy.rotated(by: rotation)
    }
}

//MARK: 5 UIPanGestureRecognizer conforming to Swipeable
extension UIPanGestureRecognizer: TinderSwipeable {}
