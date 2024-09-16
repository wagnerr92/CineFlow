//
//  ContentHeaderCell.swift
//  CineFlow
//
//  Created by Eduardo on 15/09/24.
//

import UIKit

class ContentHeaderCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var playerButton: UIButton!
    @IBOutlet weak var StarImage: UIImageView!
    @IBOutlet weak var pointsLabel: UILabel!
    
    static var identifier: String = String(describing: ContentHeaderCell.self)
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configElements()
    }
    
    func setupCell(datails: Datails){
        backgroundImage.image = datails.image
        nameLabel.text = datails.contentTitle
        infoLabel.text = ("\(datails.time)        \(datails.movieRatings)        \(datails.yearOfRelease)        \(datails.formatImage)")
        pointsLabel.text = datails.pointsMovie
    }
    
    func configElements(){
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true

        configLabel(label: nameLabel, size: 30)
        configLabel(label: infoLabel, size: 10)
        
        StarImage.image = UIImage.stars
        StarImage.backgroundColor = .clear
    
        configButton(button: playerButton)
        
        pointsLabel.textColor = .white
    }
    
    func configLabel(label: UILabel, size: CGFloat){
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: size, weight: .bold)
        label.numberOfLines = 0
        
    }
    
    func configButton(button: UIButton) {
        button.setImage(.init(systemName: "play.circle"), for: .normal)
        button.setTitle("", for: .normal)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.imageView?.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}


