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
        coverImage.contentMode = .scaleAspectFill
        coverImage.layer.borderWidth = 1
        coverImage.layer.borderColor = CFColor.white.cgColor
    }

//    public func setupCell(data: MovieSerieModel?) {
//        guard let imageURL = URL(string: data?.posterPath ?? "") else { return }
//        DispatchQueue.global().async {
//            guard let imageData = try? Data(contentsOf: imageURL) else { return }
//            DispatchQueue.main.async {
//                self.coverImage.image = UIImage(data: imageData)
//            }
//        }
//    }
    public func setupCell(data: MovieSerieModel?) {
        guard let data = data else {
            coverImage.image = UIImage(named: "placeholder") // Placeholder para imagens ausentes
            return
        }

        // Construir a URL com o base URL e o posterPath
        let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(data.posterPath)")

        // Fazer o carregamento da imagem de forma assíncrona
        DispatchQueue.global().async {
            if let imageURL = imageURL, let imageData = try? Data(contentsOf: imageURL) {
                DispatchQueue.main.async {
                    self.coverImage.image = UIImage(data: imageData)
                }
            } else {
                DispatchQueue.main.async {
                    self.coverImage.image = UIImage(named: "placeholder")
                }
            }
        }
    }

}
