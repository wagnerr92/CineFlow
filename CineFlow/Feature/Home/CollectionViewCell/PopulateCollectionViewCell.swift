//
//  PopulateCollectionViewCell.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 30/10/24.
//

import UIKit

class PopulateCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: PopulateCollectionViewCell.reuseId, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configImage()
        
    }
    private func configImage() {
        coverImage.layer.cornerRadius = 10
        coverImage.contentMode = .scaleAspectFill
        coverImage.layer.borderWidth = 1
        coverImage.layer.borderColor = CFColor.white.cgColor
    }

    public func setupCell(data: MovieSerieModel?) {
        guard let imageURL = URL(string: data?.posterPath ?? "") else { return }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async {
                self.coverImage.image = UIImage(data: imageData)
            }
        }
    }
}
