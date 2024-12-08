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
    private var filterSelected: Int = 0
    var viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayoutNavigation()
        addLayout()
        
        viewModel.didUpdateData = { [weak self] in
            DispatchQueue.main.async {
                print("Recarregando Tableview....")
                self?.tableView.reloadData()
            }
        }
        
        viewModel.didFailWithError = { error in
            print("Failed to fetch data: \(error.localizedDescription)")
        }
        
        viewModel.fetchMovies()
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
        filterSelected = 1
        tableView.reloadData()
    }
    @IBAction func tappedSerieButton(_ sender: Any) {
        movieButton.backgroundColor = .none
        serieButton.backgroundColor = CFColor.redE50914
        filterSelected = 2
        tableView.reloadData()
    }
    @IBAction func tappedAllButton(_ sender: Any) {
        movieButton.backgroundColor = .none
        serieButton.backgroundColor = .none
        filterSelected = 0
        tableView.reloadData()
    }
}

extension HomeViewController {
    private func addLayoutNavigation() {
        let searchIcon = UIBarButtonItem(
            image: CFImage.searchIcon, style: .plain, target: self,
            action: #selector(goToSearchViewController))
        navigationItem.rightBarButtonItem = searchIcon
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc private func goToSearchViewController() {
        let controller =
        UIStoryboard(name: "GenreSearch", bundle: nil)
            .instantiateViewController(
                withIdentifier: String(
                    describing: GenreSearchViewController.self))
        as? GenreSearchViewController
        navigationController?.pushViewController(
            controller ?? UIViewController(), animated: true)
    }
    private func addLayout() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            HomeTableViewCell.nib(),
            forCellReuseIdentifier: HomeTableViewCell.reuseId)
        tableView.register(
            PopulateTableViewCell.nib(),
            forCellReuseIdentifier: PopulateTableViewCell.reuseId)
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
    -> Int
    {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopulateTableViewCell.reuseId, for: indexPath) as? PopulateTableViewCell
        cell?.delegate = self        
        return cell ?? UITableViewCell()
    }
    
    func tableView(
        _ tableView: UITableView, titleForHeaderInSection section: Int
    ) -> String? {
        
        switch section {
        case 0:
            return "Lançamentos"
        case 1:
            return "Popular"
        case 2:
            return "Melhor avaliados"
        case 3:
            return "Em breve"
        default:
            break
        }
        return ""
    }
    
    func tableView(
        _ tableView: UITableView, willDisplayHeaderView view: UIView,
        forSection section: Int
    ) {
        view.tintColor = .none
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = .white
    }
    
    func tableView(
        _ tableView: UITableView, heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        150
    }
    
    func getMoviesForSection(section: Int, indexPath: IndexPath) -> MovieSerieModel? {
        switch section {
        case 0:
            return viewModel.getReleaseMoviesList(indexpath: indexPath)
        case 1:
            return viewModel.getPopularMoviesList(indexpath: indexPath)
        case 2:
            return viewModel.getTopRatedMoviesList(indexpath: indexPath)
        case 3:
            return viewModel.getUpcomingMoviesList(indexpath: indexPath)
        default:
            return nil
        }
    }
}



extension HomeViewController: PopulateTableViewCellDelegate {
    
    func populateNumberOfItemsInSection(section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section).count
    }

    func getPopulateMovies(indexPath: IndexPath) -> MovieSerieModel {
        guard let movie = getMoviesForSection(section: indexPath.section, indexPath: indexPath) else {
            fatalError("Erro ao buscar filme para a seção \(indexPath.section)")
        }
        return movie
    }
    
    func goToDetailbyPopulate(sinopse: String, title: String, cover: String, releaseYear: String) {
        navigationController?.pushViewController(
            ItemDetailViewController(
                sinopse: sinopse,
                detailItem: Details(
                    image: cover,
                    contentTitle: title,
                    time: "1H 32MIN",
                    yearOfRelease: releaseYear,
                    formatImage: "4K UHD",
                    movieRatings: "18+",
                    pointsMovie: "3.4")), animated: true)
    }
}
