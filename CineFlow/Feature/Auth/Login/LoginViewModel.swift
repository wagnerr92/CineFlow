//
//  LoginViewModel.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 19/11/24.
//

import Foundation
import Firebase
import FirebaseAuth
import GoogleSignIn

protocol LoginViewModelDelegate: AnyObject {
    func didError(message: String)
    func didSuccess()
}

class LoginViewModel {
    weak var delegate: LoginViewModelDelegate?
}

extension LoginViewModel {
    public func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.delegate?.didError(message: "Erro ao fazer login:   \(error.localizedDescription)")
            }
            self.delegate?.didSuccess()
        }
    }
    
    public func googleLogin(controller: UIViewController) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        _ = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(withPresenting: controller) { result, error in
            if let error = error {
                self.delegate?.didError(message: "Error signing in with Google: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {
                print("No user data found")
                return
            }
            
            guard let idToken = user.idToken?.tokenString else {
                print("Error: ID Token is nil.")
                return
            }
            
            let accessToken = user.accessToken.tokenString
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            Auth.auth().signIn(with: credential) { result, error in
                if let error = error {
                    self.delegate?.didError(message: "Firebase sign-in error:   \(error.localizedDescription)")
                }
                self.delegate?.didSuccess()
            }
        }
    }
}
