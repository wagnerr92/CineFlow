//
//  LoginViewController.swift
//  CineFlow
//
//  Created by Wagner Rodrigues on 14/09/24.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var enterButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        configureTextField(emailTextField, placeholder: "Digite o seu e-mail", imageName: "mailIcon")
        configureTextField(passwordTextField, placeholder: "Digite a sua senha", imageName: "passwordIcon" )
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        enterButton.isEnabled = false
    }
    
    private func configureTextField(_ textField: UITextField, placeholder: String, imageName: String) {
        textField.backgroundColor = .darkGray
        textField.layer.cornerRadius = 8.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.clipsToBounds = true
        textField.placeholder = placeholder
        textField.textColor = .white
        
        if let image = UIImage(named: imageName) {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            
            // Definir o tamanho do ícone
            let iconSize: CGFloat = 15 // Ajuste o tamanho desejado do ícone
            let padding: CGFloat = 8
            let containerWidth = iconSize + padding * 2
            let containerHeight = textField.frame.height
            
            // Criar uma UIView para conter a imagem e adicionar margem
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: containerWidth, height: containerHeight))
            
            // Posicionar a imagem dentro da containerView com padding
            imageView.frame = CGRect(x: padding, y: (containerHeight - iconSize) / 2, width: iconSize, height: iconSize)
            containerView.addSubview(imageView)
            
            // Configura a visualização da imagem à esquerda
            textField.leftView = containerView
            textField.leftViewMode = .always
        }
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
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tappedFacebookButton(_ sender: Any) {
        showNotImplementedAlert()
    }
    
    @IBAction func tappedGoogleButton(_ sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            print("Error: clientID is nil.")
            return
        }
        
        _ = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { result, error in
            if let error = error {
                print("Error signing in with Google: \(error.localizedDescription)")
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
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase sign-in error: \(error.localizedDescription)")
                    return
                }
                
                self.navigationController?.pushViewController(TabBarController(), animated: false)
                
            }
        }
    }
    
    @IBAction func tappedAppleButton(_ sender: Any) {
        showNotImplementedAlert()
    }
    
    @IBAction func tappedEnterButton(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Por favor, preencha todos os campos.")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.showAlert(message: "Erro ao fazer login: \(error.localizedDescription)")
                return
            }
            
            self.navigationController?.pushViewController(TabBarController(), animated: true)
        }
    }
    
    @IBAction func tappedRegisterButton(_ sender: Any) {
        let viewController = UIStoryboard(name: "RegisterVC", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC") as? RegisterVC
        
        navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedRecoverPassword(_ sender: Any) {
        
        let viewController = UIStoryboard(name: "RecoverPassword", bundle: nil).instantiateViewController(withIdentifier: "RecoverPassword") as? RecoverPasswordViewController
        
        navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
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
