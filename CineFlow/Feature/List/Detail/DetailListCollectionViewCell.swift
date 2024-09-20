
//
//  DetailListCollectionViewCell.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 23/08/24.
//

import UIKit

class DetailListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var coverImage: UIImageView!
    static func nib() -> UINib {
        return UINib(nibName: DetailListCollectionViewCell.reuseId, bundle: nil)
    }
    let itemTitle = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
    
    public func setupCell(data: CoverModel) {
        coverImage.image = UIImage(named: data.coverName)
    }
}
