//
//  RecoverPasswordViewModel.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 19/11/24.
//

import Foundation
import Firebase
import FirebaseAuth

protocol RecoverPasswordViewModelDelegate: AnyObject {
    func didError(message: String)
    func didSuccess()
}

class RecoverPasswordViewModel {
    weak var delegate: RecoverPasswordViewModelDelegate?
}

extension RecoverPasswordViewModel {
    public func recoverPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error {
                self.delegate?.didError(message: error.localizedDescription)
            } else {
                self.delegate?.didSuccess()
            }
        }
        
    }
}
