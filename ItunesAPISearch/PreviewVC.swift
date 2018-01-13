//
//  PreviewVC.swift
//  ItunesAPISearch
//
//  Created by james rochabrun on 12/15/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class PreviewVC: UIViewController {
    
    //MARK - Dependency
    var album: Album? {
        didSet {
            guard let album = album,
                let artworkData = album.imageData,
                let artistName = album.artistName,
                let albumName = album.collectionCensoredName else { return }
            DispatchQueue.global(qos: .background).async {
                guard let image = UIImage(data: artworkData) else { return }
                DispatchQueue.main.async {
                    let tinderCardViewModel = TinderCardViewModel(albumName: albumName, artistName: artistName, artworkPreview: image)
                    self.tinderCard.tinderCardViewModel = tinderCardViewModel
                }
            }
        }
    }
    
    //MARK - UI
    lazy var tinderCard: TinderCard = {
        let tc = TinderCard()
        tc.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(swipeCard(sender:))))
        return tc
    }()
    
    let nopeView = ImageViewFactory.standardImageView(image: #imageLiteral(resourceName: "nope"), cornerRadius: 0, interactionEnabled: false, contentMode: .scaleAspectFill, sizeToFit: true).new
    let likeView = ImageViewFactory.standardImageView(image: #imageLiteral(resourceName: "like"), cornerRadius: 0, interactionEnabled: false, contentMode: .scaleAspectFit, sizeToFit: true).new
    
    func setUpViews() {
        nopeView.alpha = 0
        likeView.alpha = 0
        view.addSubview(tinderCard)
        view.addSubview(nopeView)
        view.addSubview(likeView)
        NSLayoutConstraint.activate([
            tinderCard.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            tinderCard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tinderCard.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.70),
            tinderCard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            nopeView.widthAnchor.constraint(equalToConstant: 200),
            nopeView.heightAnchor.constraint(equalToConstant: 130),
            nopeView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            nopeView.bottomAnchor.constraint(equalTo: tinderCard.bottomAnchor, constant: -50),
            
            likeView.widthAnchor.constraint(equalToConstant: 200),
            likeView.heightAnchor.constraint(equalToConstant: 130),
            likeView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            likeView.bottomAnchor.constraint(equalTo: tinderCard.bottomAnchor, constant: -50),
            ])
    }
    
    //MARK - App lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let dismissButton = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissVC))
        self.navigationItem.rightBarButtonItem  = dismissButton
        self.setUpViews()
        self.view.backgroundColor = .white
    }

    //MARK - Navigation
    @objc func dismissVC() {
        self.dismiss(animated: true)
    }
}

//MARK - Tinder logic
extension PreviewVC {
    
    /// This is all that we need in the view controller to create the Swipe Tinder card
    @objc func swipeCard(sender: UIPanGestureRecognizer) {
        
        //protocol here
        let tupleData = sender.swipeView(tinderCard)
        
        //helper methods here
        self.updateTinderCard(alpha: tupleData.alpha)
        let moodViewsAlpha = tupleData.alpha == 1 ? 0 : (1 - tupleData.alpha)
        
        tupleData.pointX < 0 ? self.updateNopeView(alpha: moodViewsAlpha) : self.updateLikeView(alpha: moodViewsAlpha)
    }
    
    ///helper methods
    private func updateTinderCard(alpha: CGFloat) {
        tinderCard.alpha = alpha
    }
    
    private func updateLikeView(alpha: CGFloat) {
        likeView.alpha = alpha
        nopeView.alpha = 0
    }
    
    private func updateNopeView(alpha: CGFloat) {
        nopeView.alpha = alpha
        likeView.alpha = 0
    }
}




























