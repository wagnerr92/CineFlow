//
//  SearchResultTableViewCell.swift
//  CineFlow
//
//  Created by Wagner Rodrigues on 19/09/24.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    static let identifier: String = "SearchResultTableViewCell"//String(describing: SearchResultTableViewCell.self)

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
    
    func setupCell(searchResult: SearchResult){
        coverImageView.image = searchResult.coverImageName//UIImage(named: searchResult.coverImageName)
        titleLabel.text = searchResult.title
        genreLabel.text = searchResult.genre
        yearLabel.text = searchResult.releaseYear
    }
    
}
