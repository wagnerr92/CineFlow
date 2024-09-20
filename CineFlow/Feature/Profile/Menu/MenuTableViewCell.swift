//
//  MenuTableViewCell.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 18/09/24.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    var menuTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addMenuTitle()
        backgroundColor = CFColor.menuProfileBG
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuTableViewCell {
    public func setupCell(menu: String) {
        menuTitle.text = menu
    }
    
    private func addMenuTitle() {
        addSubview(menuTitle)
        menuTitle.translatesAutoresizingMaskIntoConstraints = false
        menuTitle.textColor = .white
        NSLayoutConstraint.activate([
            menuTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            menuTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            menuTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
}
