//
//  WelcomeViewController.swift
//  CineFlow
//
//  Created by Thaís Gomes on 12/09/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var letsgoButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func tappedletsgoButton(_ sender: Any) {
        let login = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as? LoginViewController
        
        //MARK: NavigationController
        navigationController?.pushViewController(login ?? UIViewController(), animated: true)
    }
}
