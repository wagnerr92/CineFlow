//
//  RegisterVC.swift
//  CineFlow
//
//  Created by Eduardo on 10/09/24.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextFileld: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordLabel: UILabel!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var passwordStatesSameLabel: UILabel!
    
    @IBOutlet weak var stateCapitalLettersImage: UIImageView!
    @IBOutlet weak var stateCapitalLettersLabel: UILabel!
    @IBOutlet weak var stateLowercaseLettersImage: UIImageView!
    @IBOutlet weak var stateLowercaserLetterLabel: UILabel!
    @IBOutlet weak var stateCharactersImage: UIImageView!
    @IBOutlet weak var stateCharactersLabel: UILabel!
    @IBOutlet weak var stateSpecialCharactersImage: UIImageView!
    @IBOutlet weak var StateSpecialCharactersLabel: UILabel!
    
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigElements()
    }
    
    @IBAction func tappedLoginAppleButton(_ sender: Any) {
    }
    
    
    @IBAction func tappedLoginFacebookButton(_ sender: Any) {
    }
    
    
    @IBAction func tappedLoginGoogleButton(_ sender: Any) {
    }
    
    @IBAction func tappedRegisterButton(_ sender: Any) {
    }
    
    func configTextField(textField: UITextField, delegate: UITextFieldDelegate, keyboard: UIKeyboardType){
        textField.delegate = delegate
        textField.keyboardType = keyboard
        
    }
    
    func ConfigElements(){
        configTextField(textField: nameTextFileld, delegate: self, keyboard: .emailAddress)
        configTextField(textField: emailTextField, delegate: self, keyboard: .emailAddress)
        configTextField(textField: passwordTextField, delegate: self, keyboard: .emailAddress)
        configTextField(textField: repeatPasswordTextField, delegate: self, keyboard: .emailAddress)
        
        disableTextField(textField: emailTextField)
        disableTextField(textField: passwordTextField)
        disableTextField(textField: repeatPasswordTextField)
        
        registerButton.isEnabled = false
        registerButton.backgroundColor = UIColor.gray
        passwordStatesSameLabel.textColor = .red
        passwordTextField.isSecureTextEntry = true
        repeatPasswordTextField.isSecureTextEntry = true
        
        configButton(button: appleButton, image: .apple, aligment: .center)
        configButton(button: facebookButton, image: .facebook, aligment: .center)
        configButton(button: googleButton, image: .google, aligment: .center)
        
        registerButton.setTitle("Regitrar", for: .normal)
        registerButton.layer.cornerRadius = 20
        
    }
    
    func disableTextField(textField: UITextField){
        textField.isEnabled = false
        textField.backgroundColor = .gray
        
    }
    
    func enableTextField(textField: UITextField){
        textField.isEnabled = true
        textField.backgroundColor = .white
    }
    
    func configButton(button: UIButton, image: UIImage?, aligment: UIControl.ContentHorizontalAlignment){
        button.setImage(image, for: .normal)
        button.contentMode = .right
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.imageView?.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.backgroundColor = .clear
        button.setTitle("", for: .normal)
        
    }
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        configSelectTextField(textField: textField)
        }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        switch textField {
            
        case nameTextFileld:
            if textField.validateName(updateAll: updatedText){
                enableTextField(textField: emailTextField)
            }else{
                disableTextField(textField: emailTextField)
            }
        case emailTextField:
            if textField.validateEmail(){
                enableTextField(textField: passwordTextField)
                enableTextField(textField: repeatPasswordTextField)
            } else {
                disableTextField(textField: passwordTextField)
                disableTextField(textField: repeatPasswordTextField)
            }
        case passwordTextField:
            if  textField.validatePasswordCapitalLetter(updateAll: updatedText){
                stateCapitalLettersLabel.textColor = .green
                stateCapitalLettersImage.image = UIImage.check
            }else {
                stateCapitalLettersLabel.textColor = .red
                stateCapitalLettersImage.image = UIImage.alert1
            }
            if  textField.validatePasswordLowercaseletter(updateAll: updatedText){
                stateLowercaserLetterLabel.textColor = .green
                stateLowercaseLettersImage.image = UIImage.check
            }else {
                stateLowercaserLetterLabel.textColor = .red
                stateLowercaseLettersImage.image = UIImage.alert1
            }
            if  textField.validatePasswordCharacters(updateAll: updatedText){
                stateCharactersLabel.textColor = .green
                stateCharactersImage.image = UIImage.check
            }else {
                stateCharactersLabel.textColor = .red
                stateCharactersImage.image = UIImage.alert1
            }
            if  textField.validatePasswordSpecialCharacters(updateAll: updatedText){
                StateSpecialCharactersLabel.textColor = .green
                stateSpecialCharactersImage.image = UIImage.check
            }else {
                StateSpecialCharactersLabel.textColor = .red
                stateSpecialCharactersImage.image = UIImage.alert1
            }
            let repeatPasswordText = repeatPasswordTextField.text ?? ""
            let passwordText = updatedText

            if repeatPasswordText == passwordText  && !passwordText.isEmpty && !repeatPasswordText.isEmpty{
                registerButton.isEnabled = true
                registerButton.backgroundColor = .white
                registerButton.titleLabel?.textColor = UIColor.black
                passwordStatesSameLabel.textColor = .green
                passwordStatesSameLabel.text = "Senhas coincidem!"
            } else {
                registerButton.isEnabled = false
                registerButton.backgroundColor = .gray
                passwordStatesSameLabel.textColor = .red
                passwordStatesSameLabel.text = "Senhas não coincidem!"
                    }
        case repeatPasswordTextField:
            let passwordText = passwordTextField.text ?? ""
            let repeatPasswordText = updatedText

            if passwordText == repeatPasswordText && !passwordText.isEmpty && !repeatPasswordText.isEmpty{
                registerButton.isEnabled = true
                registerButton.backgroundColor = .white
                registerButton.titleLabel?.textColor = UIColor.black
                passwordStatesSameLabel.textColor = .green
                passwordStatesSameLabel.text = "Senhas coincidem!"
            } else {
                registerButton.isEnabled = false
                registerButton.backgroundColor = .gray
                passwordStatesSameLabel.textColor = .red
                passwordStatesSameLabel.text = "Senhas não coincidem!"
                        }
        default:
            break
        }
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func configSelectTextField(textField: UITextField){
        textField.layer.borderColor = UIColor.green.cgColor
        textField.layer.borderWidth = 1
    }
}

extension UITextField {
    
    func validateName(updateAll: String) -> Bool {
        let nameRegex = "[a-z0-9A-Z._!@#$&].{2,}$"
        let validateRegex = NSPredicate (format: "SELF MATCHES %@", nameRegex)
        return validateRegex.evaluate(with: updateAll)
    }
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return validateRegex.evaluate(with: self.text)
    }
    
    func validatePasswordCapitalLetter(updateAll: String) -> Bool {
        let passwordRegex = ".*[A-Z]+.*"
        let validateRegex = NSPredicate (format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: updateAll)
    }
    func validatePasswordLowercaseletter(updateAll: String) -> Bool {
        let passwordRegex = ".*[a-z]+.*"
        let validateRegex = NSPredicate (format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: updateAll)
    }
    func validatePasswordCharacters(updateAll: String) -> Bool {
        let passwordRegex = ".{8,}"
        let validateRegex = NSPredicate (format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: updateAll)
    }
    func validatePasswordSpecialCharacters(updateAll: String) -> Bool {
        let passwordRegex = ".*[!@#$%^&*()_+-=\\[\\]{};':\"\\\\|,.<>/?`~§±©®™].*"
        let validateRegex = NSPredicate (format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: updateAll)
    }
}
