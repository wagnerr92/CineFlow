//
//  HomeViewModel.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 19/10/24.
//

import Foundation

final class HomeViewModel {
    private var releasedMovies: [MovieSerieModel] = []
    private var popularMovies: [MovieSerieModel] = []
    private var topRatedMovies: [MovieSerieModel] = []
    private var upcomingMovies: [MovieSerieModel] = []
    
    private let movieService = MovieService()
    
    var didUpdateData: (() -> Void)?
    var didFailWithError: ((Error) -> Void)?
    
    func fetchMovies() {
        // Fetch Lançamentos
        movieService.fetchMovies(endpoint: "now_playing") { [weak self] result in
                switch result {
                case .success(let movies):
                    self?.releasedMovies = movies
                    //print("Lançamentos recebidos: \(movies)")
                    self?.didUpdateData?()
                case .failure(let error):
                    print("Erro ao buscar lançamentos: \(error.localizedDescription)")
                    self?.didFailWithError?(error)
                }
            }
        
         //Fetch Popular
        movieService.fetchMovies(endpoint: "popular") { [weak self] result in
            switch result {
            case .success(let movies):
                self?.popularMovies = movies
                //print("Populares recebidos: \(movies)")
                self?.didUpdateData?()
            case .failure(let error):
                self?.didFailWithError?(error)
            }
        }
        
        //Fetch Melhor avaliados
        movieService.fetchMovies(endpoint: "top_rated") { [weak self] result in
            switch result {
            case .success(let movies):
                self?.topRatedMovies = movies
                //print("Tops recebidos: \(movies)")
                self?.didUpdateData?()
            case .failure(let error):
                self?.didFailWithError?(error)
            }
        }
        
        //Fetch Em breve
        movieService.fetchMovies(endpoint: "upcoming") { [weak self] result in
            switch result {
            case .success(let movies):
                self?.upcomingMovies = movies
                //print("Em breve recebidos: \(movies)")
                self?.didUpdateData?()
            case .failure(let error):
                self?.didFailWithError?(error)
            }
        }
    }
    
    public func numberOfRowsInSection(section: Int) -> [MovieSerieModel] {
        switch section {
        case 0:
            return releasedMovies
        case 1:
            return popularMovies
        case 2:
            return topRatedMovies
        case 3:
            return upcomingMovies
        default:
            return []
        }
    }
    
    public func getReleaseMoviesList(indexpath: IndexPath) -> MovieSerieModel {
        return releasedMovies[indexpath.row]
    }
    
    public func getPopularMoviesList(indexpath: IndexPath) -> MovieSerieModel {
        return popularMovies[indexpath.row]
    }
    
    public func getTopRatedMoviesList(indexpath: IndexPath) -> MovieSerieModel {
        return topRatedMovies[indexpath.row]
    }
    
    public func getUpcomingMoviesList(indexpath: IndexPath) -> MovieSerieModel {
        return upcomingMovies[indexpath.row]
    }
}
