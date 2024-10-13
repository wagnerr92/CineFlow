//
//  UISearchBar.swift
//  CineFlow
//
//  Created by Wagner Rodrigues on 13/10/24.
//

import Foundation
import UIKit

extension UISearchBar {
    func configureSearchBar(placeholderText: String = "Digite um filme ou série") {
        // Remove a borda da search bar
        self.backgroundImage = UIImage()
        self.isTranslucent = true
        
        // Customizar a cor do texto do placeholder e do texto digitado
        if let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField {
            textFieldInsideSearchBar.textColor = UIColor.white // Cor do texto digitado
            textFieldInsideSearchBar.attributedPlaceholder = NSAttributedString(
                string: placeholderText,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray] // Cor do placeholder
            )
        }
    }
}
