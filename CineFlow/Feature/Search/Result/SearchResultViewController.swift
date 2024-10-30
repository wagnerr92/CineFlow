//
//  SearchResultViewController.swift
//  CineFlow
//
//  Created by Wagner Rodrigues on 19/09/24.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var genreLabel: UILabel!
    var viewModel: SearchResultViewModel = SearchResultViewModel()
    var selectedGenre: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        
        searchBar.configureSearchBar()
        
        if let genre = selectedGenre {
                   genreLabel.text = "Resultado de gênero: \(genre)"
               }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(
            SearchResultTableViewCell.nib(),
            forCellReuseIdentifier: SearchResultTableViewCell.identifier)
    }
}

extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchResult = viewModel.getReleaseMoviesList(indexpath: indexPath, genreSelected: self.selectedGenre ?? "")

        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as? SearchResultTableViewCell
        cell?.setupCell(searchResult: searchResult[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedMovie = viewModel.getReleaseMoviesList(indexpath: indexPath, genreSelected: self.selectedGenre ?? "")
//        print("Selected movie: \(selectedMovie.title)")
//                
//        navigationController?.pushViewController(ItemDetailViewController(sinopse: selectedMovie.sinopse,
//                                                                          detailItem: Details(image: selectedMovie.posterPath,
//                                                                                              contentTitle: selectedMovie.title,
//                                                                                              time: "1H 32MIN",
//                                                                                              yearOfRelease: "2023",
//                                                                                              formatImage: "4K UHD",
//                                                                                              movieRatings: "18+",
//                                                                                              pointsMovie: "3.4")), animated: true)

        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
}
