//
//  HomeViewModel.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 19/10/24.
//

import Foundation

final class HomeViewModel {
    
    private var releasedMovies: [MovieSerieModel] = [
        MovieSerieModel(title: "Robô Selvagem", posterPath: "\(ApiSettings.imageUrl.rawValue)/pG9Vfb3r0Nwd0QO7g01CNaOowXX.jpg"),
        MovieSerieModel(title: "A Substância", posterPath: "\(ApiSettings.imageUrl.rawValue)/6L3PfQEydRzONYrhtpWtchRhOuV.jpg"),
        MovieSerieModel(title: "Azrael", posterPath: "\(ApiSettings.imageUrl.rawValue)/qpdFKDvJS7oLKTcBLXOaMwUESbs.jpg"),
        MovieSerieModel(title: "O Poço 2", posterPath: "\(ApiSettings.imageUrl.rawValue)/2fJn438T3W2XDlyBlgNuAeAAHrj.jpg"),
        MovieSerieModel(title: "Terrifier 3", posterPath: "\(ApiSettings.imageUrl.rawValue)/gU9ubNnaDKYBxs1DCSfiUIqHSMR.jpg")
    ]
    
    private var populardMovies: [MovieSerieModel] = [
        MovieSerieModel(title: "Terrifier 2", posterPath: "\(ApiSettings.imageUrl.rawValue)/kkck5DiLrGkqUDzjGQrxgD6BXVJ.jpg"),
        MovieSerieModel(title: "Transmorphers: Mech Beasts", posterPath: "\(ApiSettings.imageUrl.rawValue)/oqhaffnQqSzdLrYAQA5W4IdAoCX.jpg")
    ]
    
    public func numberOfRowsInSection(section: Int) -> [MovieSerieModel] {
        switch section {
        case 0:
            return releasedMovies
        case 1:
            return populardMovies
        default:
            break
        }
        return []
    }
    
    public func getReleaseMoviesList(indexpath: IndexPath) -> MovieSerieModel {
        return releasedMovies[indexpath.row]
    }
    
    public func getPopularMoviesList(indexpath: IndexPath) -> MovieSerieModel {
        return populardMovies[indexpath.row]
    }

}
