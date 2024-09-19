//
//  HomeCollectionViewCell.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 19/09/24.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: HomeCollectionViewCell.reuseId, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configImage()
        
    }
    private func configImage() {
        coverImage.layer.cornerRadius = 10
    }

    public func setupCell(data: CoverModel) {
        coverImage.image = UIImage(named: data.coverName)
    }
    
}
