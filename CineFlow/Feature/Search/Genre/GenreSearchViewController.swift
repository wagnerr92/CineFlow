//
//  GenreSearchViewController.swift
//  CineFlow
//
//  Created by Wagner Rodrigues on 19/09/24.
//

import UIKit

class GenreSearchViewController: UIViewController {
    
    @IBOutlet weak var genresView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Dicionário para mapear nomes de gêneros aos IDs
    private let genres: [String: Int] = [
        "Ação": 28,
        "Aventura": 12,
        "Animação": 16,
        "Comédia": 35,
        "Terror": 27,
        "Suspense": 53,
        "Romance": 10749,
        "Drama": 18
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CFColor.backgroundDefault
        
        genresView.backgroundColor = CFColor.genresViewBackground
        searchBar.configureSearchBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func tappedActionButton(_ sender: Any) {
        navigateToSearchResult(genre: "Ação")
    }
    
    @IBAction func tappedAdventureButton(_ sender: Any) {
        navigateToSearchResult(genre: "Aventura")
    }
    
    @IBAction func tappedAnimationButton(_ sender: Any) {
        navigateToSearchResult(genre: "Animação")
    }
    
    @IBAction func tappedComedyButton(_ sender: Any) {
        navigateToSearchResult(genre: "Comédia")
    }
    
    @IBAction func tappedHorrorButton(_ sender: Any) {
        navigateToSearchResult(genre: "Terror")
    }
    
    @IBAction func tappedThrillerButton(_ sender: Any) {
        navigateToSearchResult(genre: "Suspense")
    }
    
    @IBAction func tappedRomanceButton(_ sender: Any) {
        navigateToSearchResult(genre: "Romance")
    }
    
    @IBAction func tappedDramaButton(_ sender: Any) {
        navigateToSearchResult(genre: "Drama")
    }
    
    private func navigateToSearchResult(genre: String) {
        guard let genreId = genres[genre] else {
            print("Erro: Gênero \(genre) não encontrado.")
            return
        }
        
        if let controller = UIStoryboard(name: "SearchResult", bundle: nil)
            .instantiateViewController(withIdentifier: String(describing: SearchResultViewController.self)) as? SearchResultViewController {
            
            controller.selectedGenre = genre
            controller.selectedGenreId = genreId // Passa o ID do gênero
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}

