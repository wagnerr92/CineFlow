//
//  ActorsCollectionViewCell.swift
//  CineFlow
//
//  Created by Eduardo on 16/09/24.
//

import UIKit

class ActorsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var actorNameLabel: UILabel!
    
    static var identifier: String = String(describing: ActorsCollectionViewCell.self)
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configElements()
    }
    
    func setupCell(nameImage: String, nameLabel: String) {
        actorImage.image = UIImage(named: nameImage)
        actorNameLabel.text = nameLabel
    }
    
    func configElements(){
        actorNameLabel.textColor = .white
        actorNameLabel.textAlignment = .center
        actorNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        actorImage.contentMode = .scaleToFill
        actorImage.clipsToBounds = true
        actorImage.layer.cornerRadius = 60
        view.backgroundColor = .black
    }

}
