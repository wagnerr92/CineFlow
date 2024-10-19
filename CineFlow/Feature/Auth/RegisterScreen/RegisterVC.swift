//
//  RegisterVC.swift
//  CineFlow
//
//  Created by Eduardo on 10/09/24.
//

import UIKit
import FirebaseAuth

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
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var eyesPasswordButton: UIButton!
    @IBOutlet weak var eyesRepeatPasswordbutton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigElements()
    }
    
    @IBAction func tappedEyesPasswordButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        passwordTextField.isSecureTextEntry.toggle()
        alterneteImage(eyesButton: eyesPasswordButton)
    }
    
    @IBAction func tappedEyesRepeatPasswordButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        repeatPasswordTextField.isSecureTextEntry.toggle()
        alterneteImage(eyesButton: eyesRepeatPasswordbutton)
    }
    
    @IBAction func tappedRegisterButton(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let repeatPassword = repeatPasswordTextField.text, password == repeatPassword else {
            showAlert(message: "Por favor, preencha todos os campos corretamente.")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.showAlert(message: "Erro ao criar a conta: \(error.localizedDescription)")
            } else {
                // Mensagem de sucesso com ação para voltar ao Login
                let alert = UIAlertController(title: "Sucesso", message: "Conta criada com sucesso!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    // Voltar para a tela de login após o OK
                    self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    @IBAction func tappedReturnButton(_ sender: Any) {
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
        configButton(button: returnButton, image: UIImage(systemName: "arroy.left"), aligment: .center
        )
        
        disableTextField(textField: emailTextField)
        disableTextField(textField: passwordTextField)
        disableTextField(textField: repeatPasswordTextField)
        returnButton.isHidden = true
        
        registerButton.isEnabled = false
        registerButton.backgroundColor = UIColor.gray
        passwordStatesSameLabel.textColor = .red
        passwordTextField.isSecureTextEntry = true
        repeatPasswordTextField.isSecureTextEntry = true
        
        configButton(button: eyesPasswordButton, image: .eyesClose, aligment: .center)
        configButton(button: eyesRepeatPasswordbutton, image: .eyesClose, aligment: .center)
        configButton(button: returnButton, image: UIImage(systemName: "arrow.left"), aligment: .center)
        
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
    
    func alterneteImage(eyesButton: UIButton){
        
        if eyesButton.currentImage == UIImage.oppenEyes {
            configButton(button: eyesButton, image: .eyesClose, aligment: .center)
        } else {
            configButton(button: eyesButton, image: .oppenEyes, aligment: .center)
        }
    }
    
    func configButton(button: UIButton, image: UIImage?, aligment: UIControl.ContentHorizontalAlignment){
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.imageView?.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.backgroundColor = .clear
        button.setTitle("", for: .normal)
        button.contentHorizontalAlignment = .right
    }
}

extension RegisterVC: UITextFieldDelegate {
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
