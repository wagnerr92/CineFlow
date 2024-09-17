//
//  MovieImageCollectionCell.swift
//  CineFlow
//
//  Created by Eduardo on 16/09/24.
//

import UIKit

class MovieImageCollectionCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var photosImage: UIImageView!
    
    static var identifier: String = String(describing: MovieImageCollectionCell.self)
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.backgroundColor = .clear
        configElementes()
    }
    
    func setupCell(nameImage: String){
        photosImage.image = UIImage(named: nameImage)
    }
    func configElementes(){
        photosImage.contentMode = .scaleAspectFill
        photosImage.clipsToBounds = true
        photosImage.layer.cornerRadius = 10
    }
}
