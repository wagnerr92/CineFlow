//
//  HomeViewController.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 16/09/24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addConfigNavigation()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationController?.isNavigationBarHidden = true
    }
}

extension HomeViewController {
    private func addConfigNavigation() {
        title = "Home"
        
        
    }
}
