//
//  DescriptionCell.swift
//  CineFlow
//
//  Created by Eduardo on 16/09/24.
//

import UIKit

class DescriptionCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static var identifier: String = String(describing: DescriptionCell.self)
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configLabel(label: descriptionLabel, size: 15)
        view.backgroundColor = .black
    }
    
    func setupCell(data: MovieDescription){
        descriptionLabel.text = data.descripton
    }
    
    func configLabel(label: UILabel, size: CGFloat){
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: size, weight: .light)
        label.numberOfLines = 0
    }
}
