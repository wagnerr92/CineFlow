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
        showNotImplementedAlert(title: "Adicionar", message: "Deseja adicionar a lista?")
    }
    
    @IBAction func tappedAddButton(_ sender: Any) {
        
    }
    func showAllert(title:String, message:String){
        let alertErroLogin: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title:"OK", style: .default)
        alertErroLogin.addAction(okButton)
        self.present(alertErroLogin, animated: true, completion: true)
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
