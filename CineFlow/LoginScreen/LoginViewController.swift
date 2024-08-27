//
//  LoginViewController.swift
//  CineFlow
//
//  Created by Wagner Rodrigues on 26/08/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerLabel: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()

            view.backgroundColor = .black
        
        registerLabel.textColor = .white
            
            // Configurar os text fields com placeholders
            configureTextField(emailTextField, placeholder: "Digite o seu e-mail")
            configureTextField(passwordTextField, placeholder: "Digite a sua senha")
        }

        private func configureTextField(_ textField: UITextField, placeholder: String) {
            textField.backgroundColor = .darkGray
            textField.layer.cornerRadius = 8.0
            textField.layer.borderColor = UIColor.black.cgColor
            textField.layer.borderWidth = 1.0
            textField.clipsToBounds = true
            
            textField.placeholder = placeholder
            
        }
    @IBAction func facebookButton(_ sender: UIButton) {
    }
    
    @IBAction func googleButton(_ sender: UIButton) {
    }
    
    @IBAction func appleButton(_ sender: UIButton) {
    }
    
    @IBAction func enterButton(_ sender: UIButton) {
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
    }
}
