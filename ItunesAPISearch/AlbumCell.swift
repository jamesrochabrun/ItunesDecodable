//
//  AlbumCell.swift
//  ItunesAPISearch
//
//  Created by James Rochabrun on 4/28/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

protocol AlbumCellDelegate: class {
    func openAlbumArtwork()
}

class AlbumCell: UITableViewCell {
    
    let albumImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "albumPlaceholder")
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    let albumNameLabel: UILabel = {
        let l = UILabel()
        l.sizeToFit()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let genreLabel: UILabel = {
        let l = UILabel()
        l.sizeToFit()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let dateLabel: UILabel = {
        let l = UILabel()
        l.sizeToFit()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    weak var delegate: AlbumCellDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    func setUpViews() {
        addSubview(albumImageView)
        addSubview(albumNameLabel)
        addSubview(genreLabel)
        addSubview(dateLabel)
        albumImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
        
        NSLayoutConstraint.activate([
            
            albumImageView.heightAnchor.constraint(equalTo: heightAnchor),
            albumImageView.widthAnchor.constraint(equalTo: heightAnchor),
            albumImageView.leftAnchor.constraint(equalTo: leftAnchor),
            albumImageView.topAnchor.constraint(equalTo: topAnchor),
            
            genreLabel.centerYAnchor.constraint(equalTo: albumImageView.centerYAnchor),
            genreLabel.leftAnchor.constraint(equalTo: albumImageView.rightAnchor, constant: 15),
            genreLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            
            albumNameLabel.bottomAnchor.constraint(equalTo: genreLabel.topAnchor),
            albumNameLabel.leftAnchor.constraint(equalTo: genreLabel.leftAnchor),
            albumNameLabel.rightAnchor.constraint(equalTo: genreLabel.rightAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor),
            dateLabel.leftAnchor.constraint(equalTo: genreLabel.leftAnchor),
            dateLabel.rightAnchor.constraint(equalTo: genreLabel.rightAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Helper method
extension AlbumCell {
    
    func configure(with viewModel: AlbumCellViewModel) {
        
        if let genreName = viewModel.genre?.name {
            genreLabel.text = genreName
        }
        albumNameLabel.text = viewModel.title
        albumImageView.image = viewModel.artwork
    }
}

//MARK: Delegate method action
extension AlbumCell {
    
    func imageTapped() {
        delegate?.openAlbumArtwork()
    }
}








