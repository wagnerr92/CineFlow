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
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayout()
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
}

extension AddListViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        saveButton.isEnabled = ((nameListTextField.text?.isEmpty) != false) ? false : true
    }
}

extension AddListViewController: ListViewModelDelegate {
    func didSuccess() {
        navigationController?.popViewController(animated: true)
    }
}

extension AddListViewController {
    private func addLayout() {
        self.saveButton.layer.cornerRadius = 5
        self.descriptionTextView.layer.cornerRadius = 5
        self.viewModel.delegate = self
        self.nameListTextField.delegate = self
        self.descriptionTextView.isEditable = true
        self.saveButton.isEnabled = false
        if saveButton.isEnabled == false {
            saveButton.backgroundColor = .systemGray
        }
        updateLayout()
    }
}
