//
//  SearchResultTableViewCell.swift
//  CineFlow
//
//  Created by Wagner Rodrigues on 19/09/24.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    static var identifier: String = "SearchResultTableViewCell"//String(describing: SearchResultTableViewCell.self)

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(searchResult: MovieSerieModel){
        guard let imageURL = URL(string: searchResult.posterPath ) else { return }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async {
                self.coverImageView.image = UIImage(data: imageData)
            }
        }
        titleLabel.text = searchResult.title
        genreLabel.text = searchResult.genre
        yearLabel.text = searchResult.releaseYear
        coverImageView.contentMode = .scaleAspectFit

    }
    
}
