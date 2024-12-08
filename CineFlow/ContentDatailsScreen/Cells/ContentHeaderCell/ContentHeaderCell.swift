//
//  ContentHeaderCell.swift
//  CineFlow
//
//  Created by Eduardo on 15/09/24.
//

import UIKit

protocol ContentHeaderCellProtocol: AnyObject{
    func didtappedReturnButton()
    func didtappedAddButton()
    
}
class ContentHeaderCell: UITableViewCell {
    
    weak var delegate: ContentHeaderCellProtocol?

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var playerButton: UIButton!
    @IBOutlet weak var StarImage: UIImageView!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    static var identifier: String = String(describing: ContentHeaderCell.self)
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configElements()
    }
    
    @IBAction func tappedReturnButton(_ sender: UIButton) {
        delegate?.didtappedReturnButton()
    }
    
    @IBAction func tappedAddButton(_ sender: Any) {
        delegate?.didtappedAddButton()
    }
    
    func setupCell(details: Details) {
        // Garantir que o valor de `details.image` seja desempacotado
        guard let rawImagePath = details.image else {
            backgroundImage.image = UIImage(named: "placeholder")
            return
        }
        
        let imagePath = rawImagePath.replacingOccurrences(of: "Optional(\"", with: "").replacingOccurrences(of: "\")", with: "")
        
        // Construir a URL para a imagem
        guard let imageURL = URL(string: imagePath) else {
            backgroundImage.image = UIImage(named: "placeholder") // Imagem padrão se a URL for inválida
            return
        }

        // Carregar a imagem de forma assíncrona
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: imageURL) {
                DispatchQueue.main.async {
                    self.backgroundImage.image = UIImage(data: imageData)
                }
            } else {
                DispatchQueue.main.async {
                    self.backgroundImage.image = UIImage(named: "placeholder") // Placeholder se o carregamento falhar
                }
            }
        }

        // Configurar os outros elementos
        nameLabel.text = details.contentTitle
        infoLabel.text = "\(details.time)        \(details.movieRatings)        \(details.yearOfRelease)        \(details.formatImage)"
        pointsLabel.text = details.pointsMovie
    }

    func configElements(){
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true

        configLabel(label: nameLabel, size: 30)
        configLabel(label: infoLabel, size: 10)
        
        StarImage.image = UIImage.stars
        StarImage.backgroundColor = .clear
    
        configButton(button: playerButton, nameButton: .init(systemName: "play.circle"), whidth: 40, height: 40)
        configButton(button: returnButton, nameButton: .init(systemName: "arrow.left.circle.fill"), whidth: 30, height: 30)
        configButton(button: addButton, nameButton: .init(systemName: "plus.circle.fill"), whidth: 30, height: 30)
        
        pointsLabel.textColor = .white
    }
    
    func configLabel(label: UILabel, size: CGFloat){
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: size, weight: .bold)
        label.numberOfLines = 0
    }
    
    func configButton(button: UIButton, nameButton: UIImage?, whidth: Int, height: Int) {
        button.setImage(nameButton, for: .normal)
        button.setTitle("", for: .normal)
        button.backgroundColor = .clear
        button.tintColor = .white
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.widthAnchor.constraint(equalToConstant: CGFloat(whidth)).isActive = true
        button.imageView?.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
    }
}
