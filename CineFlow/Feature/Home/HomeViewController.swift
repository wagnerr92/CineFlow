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
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.isHidden = false
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
        let searchIcon = UIBarButtonItem(image: CFImage.searchIcon, style: .plain, target: self, action: #selector(goToSearchViewController))
        navigationItem.rightBarButtonItem = searchIcon
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc private func goToSearchViewController() {
        let controller = UIStoryboard(name: "GenreSearch", bundle: nil).instantiateViewController(withIdentifier: String(describing: GenreSearchViewController.self)) as? GenreSearchViewController
        navigationController?.pushViewController(controller ?? UIViewController(), animated: true)
    }
    private func addLayout() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeTableViewCell.nib(), forCellReuseIdentifier: HomeTableViewCell.reuseId)
        tableView.backgroundColor = .none
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseId, for: indexPath) as? HomeTableViewCell
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Lançamentos"
    }
        
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .none
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = .white
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}

extension HomeViewController: HomeTableViewCellDelegate {
    func goToDetail() {
        let controller = UIStoryboard(name: "ContentDetailsVC", bundle: nil).instantiateViewController(withIdentifier: String(describing: ContentDetailsVC.self)) as? ContentDetailsVC
        navigationController?.pushViewController(controller ?? UIViewController(), animated: true)
    }
}
