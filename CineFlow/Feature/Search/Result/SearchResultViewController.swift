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

    let searchResults: [SearchResult] = [
        SearchResult(
            title: "Inception", genre: "Sci-Fi", releaseYear: "2010",
            coverImageName: UIImage.apple),
        SearchResult(
            title: "The Dark Knight", genre: "Action", releaseYear: "2008",
            coverImageName: UIImage.apple),
        SearchResult(
            title: "Interstellar", genre: "Sci-Fi", releaseYear: "2014",
            coverImageName: UIImage.apple)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
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
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
}
