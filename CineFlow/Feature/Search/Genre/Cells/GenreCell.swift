//
//  GenreCell.swift
//  CineFlow
//
//  Created by Eduardo on 19/09/24.
//

import UIKit

class GenreCell: UICollectionViewCell {
    
    static var identifier: String = String(describing: GenreCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var nameGenreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configElementes()
    }
    
    func setupCell(data: Genre){
        backgroundImage.image = data.image
        nameGenreLabel.text = data.name
    }
    
    func configElementes(){
        backgroundImage.tintColor = .black
        backgroundImage.alpha = 0.1 //deixando a imagem opaca
        nameGenreLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }

    
}
