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
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var registerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        registerLabel.textColor = .white
        
        configureTextField(emailTextField, placeholder: "Digite o seu e-mail")
        configureTextField(passwordTextField, placeholder: "Digite a sua senha")
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        enterButton.isEnabled = false
    }
    
    private func configureTextField(_ textField: UITextField, placeholder: String) {
        textField.backgroundColor = .darkGray
        textField.layer.cornerRadius = 8.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.clipsToBounds = true
        textField.placeholder = placeholder
        textField.textColor = .white
    }
    
    private func updateEnterButtonState() {
        let isEmailFilled = emailTextField.hasText
        let isPasswordFilled = passwordTextField.hasText
        enterButton.isEnabled = isEmailFilled && isPasswordFilled
    }
    
    private func showNotImplementedAlert() {
        let alert = UIAlertController(title: "Atenção", message: "Funcionalidade ainda não implementada", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func facebookButton(_ sender: UIButton) {
        showNotImplementedAlert()
    }
    
    @IBAction func googleButton(_ sender: UIButton) {
        showNotImplementedAlert()
    }
    
    @IBAction func appleButton(_ sender: UIButton) {
        showNotImplementedAlert()
    }
    
    @IBAction func enterButton(_ sender: UIButton) {
        showNotImplementedAlert()
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        showNotImplementedAlert()
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        DispatchQueue.main.async {
            self.updateEnterButtonState()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.black.cgColor
        
        updateEnterButtonState()
    }
}
