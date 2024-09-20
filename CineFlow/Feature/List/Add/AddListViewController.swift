//
//  AddListViewController.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 21/08/24.
//

import UIKit

class AddListViewController: UIViewController {
    var viewModel = ListViewModel()
  
    @IBOutlet weak var nameListTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
}

extension AddListViewController {
    @IBAction func backNavigation(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func SaveList(_ sender: UIButton) {
        self.viewModel.saveList(nameList: self.nameListTextField.text ?? "")
    }
    
    func updateLayout() {
        if (self.nameListTextField.text?.isEmpty == false) {
            saveButton.isEnabled = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension AddListViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        saveButton.isEnabled = ((nameListTextField.text?.isEmpty) != false) ? false : true
    }
}

extension AddListViewController: ListViewModelDelegate {
    func didSuccess() {
        showSimpleAlert(title: "Sucesso", message: "Lista criada!", customTitle: "Ok", customHandler: {_ in
            self.navigationController?.popViewController(animated: true)
        })
    }
}

extension AddListViewController {
    private func addLayout() {
        self.saveButton.layer.cornerRadius = 5
        self.viewModel.delegate = self
        self.nameListTextField.delegate = self
        self.saveButton.isEnabled = false
        if saveButton.isEnabled == false {
            saveButton.backgroundColor = .systemGray
        }
        updateLayout()
    }
}
