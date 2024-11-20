//
//  RegisterViewModel.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 19/11/24.
//

import Foundation
import FirebaseAuth

protocol RegisterViewModelDelegate: AnyObject {
    func didError(message: String)
    func didSuccess()
}

class RegisterViewModel {
    weak var delegate: RegisterViewModelDelegate?
}

extension RegisterViewModel {
    public func registerUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.delegate?.didError(message: "Erro ao criar a conta: \(error.localizedDescription)")
            }
            self.delegate?.didSuccess()
        }
    }
}
