//
//  HomeViewController.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 18/09/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var movieButton: UIButton!
    @IBOutlet weak var serieButton: UIButton!
    @IBOutlet weak var allButtons: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayoutNavigation()
        addLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func tappedMovieButton(_ sender: Any) {
        movieButton.backgroundColor = CFColor.redE50914
        serieButton.backgroundColor = .none
    }
    @IBAction func tappedSerieButton(_ sender: Any) {
        movieButton.backgroundColor = .none
        serieButton.backgroundColor = CFColor.redE50914
    }
    @IBAction func tappedAllButton(_ sender: Any) {
        movieButton.backgroundColor = .none
        serieButton.backgroundColor = .none
    }
}


extension HomeViewController {
    private func addLayoutNavigation() {
        let searchIcon = UIBarButtonItem(image: CFImage.searchIcon, style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = searchIcon
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func addLayout() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.reuseId)
        movieButton.layer.borderColor = CFColor.white.cgColor
        movieButton.layer.borderWidth = 1
        movieButton.layer.cornerRadius = 10
        serieButton.layer.borderColor = CFColor.white.cgColor
        serieButton.layer.borderWidth = 1
        serieButton.layer.cornerRadius = 10
        allButtons.layer.borderColor = CFColor.white.cgColor
        allButtons.layer.borderWidth = 1
        allButtons.layer.cornerRadius = 10
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseId, for: indexPath) as? HomeTableViewCell
        
        if let cell = cell {
            cell.setup(image: UIImage(systemName: "person") ?? UIImage())
        }
        
        return cell ?? UITableViewCell()
    }
}
