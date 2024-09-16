//
//  RecoverPasswordViewController.swift
//  CineFlow
//
//  Created by Wagner Rodrigues on 16/09/24.
//
import UIKit

class RecoverPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = CFColor.backgroundDefault
        
        configureTextField(emailTextField, placeholder: "Digite o seu e-mail", imageName: "mailIcon")
        emailTextField.delegate = self
        
        // Iniciar o botão desabilitado
        sendButton.isEnabled = false
    }
    
    private func configureTextField(_ textField: UITextField, placeholder: String, imageName: String) {
        textField.backgroundColor = .darkGray
        textField.layer.cornerRadius = 8.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.clipsToBounds = true
        textField.placeholder = placeholder
        textField.textColor = .black
        
        if let image = UIImage(named: imageName) {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            
            let iconSize: CGFloat = 15
            let padding: CGFloat = 8
            let containerWidth = iconSize + padding * 2
            let containerHeight = textField.frame.height
            
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: containerWidth, height: containerHeight))
            imageView.frame = CGRect(x: padding, y: (containerHeight - iconSize) / 2, width: iconSize, height: iconSize)
            containerView.addSubview(imageView)
            
            textField.leftView = containerView
            textField.leftViewMode = .always
        }
    }
    
    private func updateEnterButtonState() {
        // Verificar se o campo de texto contém o caractere "@".
        if let emailText = emailTextField.text, emailText.contains("@") {
            sendButton.isEnabled = true
        } else {
            sendButton.isEnabled = false
        }
    }

    @IBAction func tappedSendButton(_ sender: Any) {
        showEmailSentAlert()
    }

       private func showEmailSentAlert() {
           let alertController = UIAlertController(title: "Sucesso", message: "E-mail de recuperação enviado com sucesso!", preferredStyle: .alert)

           let subview = alertController.view.subviews.first?.subviews.first?.subviews.first
           subview?.backgroundColor = UIColor.systemGreen
           subview?.layer.cornerRadius = 10.0

           alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

           self.present(alertController, animated: true, completion: nil)
       }
}

extension RecoverPasswordViewController: UITextFieldDelegate {
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
