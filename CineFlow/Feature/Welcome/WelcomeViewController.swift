//
//  WelcomeViewController.swift
//  CineFlow
//
//  Created by Thaís Gomes on 12/09/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private var mainView: WelcomeView = .init()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayout()
    }
}

extension WelcomeViewController {
    private func addUserDefaults() {
        Persistence.adduserDefault("isFirstTime", value: false)
    }
    
    private func addAction() {
        self.mainView.welcomeButton.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
    }
    
    @objc private func goToLogin() {
        addUserDefaults()
        let login = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as? LoginViewController
        navigationController?.pushViewController(login ?? UIViewController(), animated: true)
    }
}

extension WelcomeViewController {
    private func addLayout() {
        addAction()
    }
}

