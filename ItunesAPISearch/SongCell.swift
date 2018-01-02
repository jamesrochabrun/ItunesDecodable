//
//  SongCell.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 4/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class SongCell: UITableViewCell {
    
    let songNameLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let durationLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .right
        return l
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    func setUpViews() {
        addSubview(songNameLabel)
        addSubview(durationLabel)
        
        NSLayoutConstraint.activate([
            
            songNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            songNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            songNameLabel.rightAnchor.constraint(equalTo: durationLabel.leftAnchor, constant: -10),
            
            durationLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            durationLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            durationLabel.widthAnchor.constraint(equalToConstant: 100)
            ])        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Helper method
extension SongCell {

    func configure(with viewModel: SongViewModel) {
        songNameLabel.text = viewModel.title
        durationLabel.text = viewModel.duration
    }
}









