//
//  UIImage+Extension.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 21/08/24.
//

import UIKit

extension UIImageView {
    func fetchImage(url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
