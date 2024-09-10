//
//  Alert.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 23/08/24.
//

import UIKit

extension UIViewController {
    func showSimpleAlert(title: String,
                         message: String?,
                         customTitle: String? = nil,
                         customHandler: ((UIAlertAction) -> Void)? = nil,
                         cancelTitle: String? = nil,
                         cancelHandler: ((UIAlertAction) -> Void)? = nil,
                         cancelTitleStyle: (UIAlertAction.Style) = .destructive) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okBt = UIAlertAction(title: customTitle, style: .default) { (alertAction) in
            alert.dismiss(animated: true, completion: nil)
            customHandler?(alertAction)
        }
        alert.addAction(okBt)
        if let cancelTitle = cancelTitle {
            let cancelBt = UIAlertAction(title: cancelTitle, style: cancelTitleStyle) { (alertAction) in
                alert.dismiss(animated: true, completion: nil)
                cancelHandler?(alertAction)
            }
            alert.addAction(cancelBt)
        }
        present(alert, animated: true, completion: nil)
    }
}
