//
//  DetailListCollectionViewCell.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 23/08/24.
//

import UIKit

class DetailListCollectionViewCell: UICollectionViewCell {
    let itemTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addCategoryTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCategoryTitle() {
        addSubview(itemTitle)
        
        itemTitle.translatesAutoresizingMaskIntoConstraints = false
        itemTitle.numberOfLines = 0
        itemTitle.textColor = CFColor.white
        itemTitle.textAlignment = .center
        
        NSLayoutConstraint.activate([
            itemTitle.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 5),
            itemTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            itemTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
