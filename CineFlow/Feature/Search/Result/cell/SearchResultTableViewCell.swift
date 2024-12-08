//
//  SearchResultTableViewCell.swift
//  CineFlow
//
//  Created by Wagner Rodrigues on 19/09/24.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    static var identifier: String = "SearchResultTableViewCell"

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
    
    // Dicionário de mapeamento de IDs para nomes de gêneros
        private let genreMap: [Int: String] = [
            28: "Ação",
            12: "Aventura",
            16: "Animação",
            35: "Comédia",
            80: "Crime",
            99: "Documentário",
            18: "Drama",
            10751: "Família",
            14: "Fantasia",
            36: "História",
            27: "Terror",
            10402: "Música",
            9648: "Mistério",
            10749: "Romance",
            878: "Ficção Científica",
            10770: "Cinema TV",
            53: "Thriller",
            10752: "Guerra",
            37: "Faroeste"
        ]
        
        func setupCell(searchResult: MovieSerieModel) {
            // Carregar imagem do poster
            if let imageURL = URL(string: "\(ApiSettings.imageUrl.rawValue)\(searchResult.posterPath)") {
                DispatchQueue.global().async {
                    guard let imageData = try? Data(contentsOf: imageURL) else { return }
                    DispatchQueue.main.async {
                        self.coverImageView.image = UIImage(data: imageData)
                    }
                }
            }
            
            titleLabel.text = searchResult.title
            
            // Mapear IDs dos gêneros para nomes
            let genres = searchResult.genreIds.compactMap { genreMap[$0] }.joined(separator: ", ")
            genreLabel.text = genres.isEmpty ? "Gênero desconhecido" : genres
            
            // Configurar ano de lançamento
            yearLabel.text = String(searchResult.releaseYear.prefix(4))
            
            coverImageView.contentMode = .scaleAspectFit
        }
    
}
