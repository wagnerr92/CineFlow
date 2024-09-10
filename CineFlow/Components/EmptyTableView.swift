//
//  EmptyTableView.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 20/08/24.
//

import UIKit

final class EmptyTableView: UIView {
    
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    
    init(titleLabel: String?, messageLabel: String?, isHideNewButton: Bool = true) {
        self.titleLabel.text = titleLabel
        self.messageLabel.text = messageLabel
        super.init(frame: .zero)
        addLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addEmptyTitle() {
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = CFColor.white
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
          
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func addEmptyMessage() {
        addSubview(messageLabel)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
         
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            messageLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor)
        ])
    }
}

extension EmptyTableView {
    private func addLayout() {
        backgroundColor = CFColor.backgroundDefault
        addEmptyTitle()
        addEmptyMessage()
    }
}

