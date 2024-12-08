//
//  SearchResultViewModel.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 30/10/24.
//

import Foundation

class SearchResultViewModel {
    private var movies: [MovieSerieModel] = []
    private let movieService = MovieService()
    var didUpdateMovies: (() -> Void)?
    var didFailWithError: ((Error) -> Void)?
    
    func fetchMoviesByGenre(genreId: Int) {
        // endpoint com base no gênero
        movieService.fetchMoviesByGenre(genreId: genreId) { [weak self] result in
            switch result {
            case .success(let movies):
                // Atualize os filmes recebidos e notifica a ViewController
                self?.movies = movies
                print("Filmes encontrados para o gênero \(genreId): \(movies)")
                self?.didUpdateMovies?()
            case .failure(let error):
                print("Erro ao buscar filmes por gênero \(genreId): \(error.localizedDescription)")
                self?.didFailWithError?(error)
            }
        }
    }


    
    func numberOfRowsInSection() -> Int {
        return movies.count
    }
    
    func getReleaseMoviesList(indexpath: IndexPath) -> MovieSerieModel {
        return movies[indexpath.row]
    }
}
