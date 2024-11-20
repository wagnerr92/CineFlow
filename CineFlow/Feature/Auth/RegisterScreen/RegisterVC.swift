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
    
    var viewModel: RegisterViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
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
            showSimpleAlert(title: "Atenção", message: "Por favor, preencha todos os campos corretamente.", customTitle: "OK")
            return
        }
        viewModel.registerUser(email: email, password: password)
    }
    
    
    @IBAction func tappedReturnButton(_ sender: Any) {
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

extension RegisterVC: RegisterViewModelDelegate {
    func didError(message: String) {
        showSimpleAlert(title: "Atenção", message: message, customTitle: "OK")
    }
    
    func didSuccess() {
        showSimpleAlert(title: "Sucesso", message: "Conta criada com sucesso!", customTitle: "OK")
    }
}
