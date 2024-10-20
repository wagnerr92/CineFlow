//
//  SearchResultViewController.swift
//  CineFlow
//
//  Created by Wagner Rodrigues on 19/09/24.
//

import UIKit

class SearchResultViewController: UIViewController, NavigationCellProtocol{
    
    func didtappedNavigateButton() {
        let viewController = UIStoryboard(name: "ContentDetailsVC", bundle: nil).instantiateViewController(withIdentifier: "ContentDetailsVC") as? ContentDetailsVC
        
        navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var genreLabel: UILabel!
    
    var selectedGenre: String?
    
    let searchResults: [SearchResult] = [
        SearchResult(
            title: "Deadpool 1", genre: "Ação", releaseYear: "2018",
            coverImageName: UIImage.deadpool1),
        SearchResult(
            title: "Deadpool 2", genre: "Ação", releaseYear: "2021",
            coverImageName: UIImage.deadpool2),
        SearchResult(
            title: "Deadpool & Wolverine", genre: "Ação", releaseYear: "2024",
            coverImageName: UIImage.deadpool3)
    ]
    
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
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchResult = searchResults[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as? SearchResultTableViewCell
        cell?.setupCell(searchResult: searchResult)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedMovie = searchResults[indexPath.row]
        print("Selected movie: \(selectedMovie.title)")
        
        let controller = UIStoryboard(name: "ContentDetailsVC", bundle: nil).instantiateViewController(withIdentifier: String(describing: ContentDetailsVC.self)) as? ContentDetailsVC
        navigationController?.pushViewController(controller ?? UIViewController(), animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
}
