//
//  PersonalDataViewController.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 18/09/24.
//

import UIKit

class PersonalDataViewController: UIViewController {

    @IBOutlet weak var nameUserTextField: UITextField!
    @IBOutlet weak var emailUserTextField: UITextField!
    @IBOutlet weak var saveButtom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayoutNavigation()
        configTextField()
        addLayout()
    }
    @IBAction func tappeSave(_ sender: Any) {
        showSimpleAlert(title: "Sucesso", message: "Dados alterado com sucesso", customTitle: "ok") { _ in
            self.nameUserTextField.isEnabled = false
            self.emailUserTextField.isEnabled = false
            self.saveButtom.isEnabled = false
            self.addLayout()
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension PersonalDataViewController {
    @objc private func editFields() {
        nameUserTextField.isEnabled = true
        emailUserTextField.isEnabled = true
        saveButtom.isEnabled = true
        addLayout()
    }
    
    
}
extension PersonalDataViewController {
    private func addLayoutNavigation() {
        let editIcon = UIBarButtonItem(image: CFImage.editIcon, style: .plain, target: self, action: #selector(editFields))
        navigationItem.rightBarButtonItem = editIcon
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func configTextField() {
        nameUserTextField.text = "Nome do usuário"
        emailUserTextField.text = "E-mail do usuario"
    }
    
    private func addLayout() {
        if (nameUserTextField.isEnabled == false) || (emailUserTextField.isEnabled == false) {
            nameUserTextField.backgroundColor = .lightGray
            emailUserTextField.backgroundColor = .lightGray
        } else {
            nameUserTextField.backgroundColor = .white
            emailUserTextField.backgroundColor = .white
        }
    }
}
