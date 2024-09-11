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
    @IBOutlet weak var nameTextField: UITextField!
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

    }

}
