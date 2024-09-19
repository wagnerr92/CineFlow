//
//  HomeTableViewCell.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 19/09/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

//    let collectionView = UICollectionView()
    var titleLabel = UILabel()
    var coverImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addTitleLabel()
        addCoverImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeTableViewCell {
    private func addCoverImage() {
        addSubview(coverImage)
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        coverImage.contentMode = .scaleAspectFill
        NSLayoutConstraint.activate([
            coverImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            coverImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            coverImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            coverImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
        ])
        
    }
    private func addTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
        ])
    }
    public func setup(image: UIImage) {
        coverImage.image = image
    }
}
