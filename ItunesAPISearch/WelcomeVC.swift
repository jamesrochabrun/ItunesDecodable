//
//  ViewController.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 4/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
    
    lazy var searchButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Search", for: .normal)
        b.setTitleColor(.blue, for: .normal)
        b.addTarget(self, action: #selector(displaySearchResultsVC), for: .touchUpInside)
        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
 
        
        //MARK Dummy examples 
        let se = Itunes.search(term: "rolling stones", media: .music(entity: .musicArtist, attribute: .artistTerm))
        
        print(se.request)
        
        print("#######################################")
        
        let le = Itunes.lookUP(id: 159260351, entity: MusicEntity.album)
        
        print(le.request)
        
    }

    private func setUpViews() {
        view.backgroundColor = .white
        view.addSubview(searchButton)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
    }
    
    @objc private func displaySearchResultsVC() {
        
        let searchResultsVC = SearchResultsVC()
        let navVC = UINavigationController(rootViewController: searchResultsVC)
        self.present(navVC, animated: true)
    }
}







