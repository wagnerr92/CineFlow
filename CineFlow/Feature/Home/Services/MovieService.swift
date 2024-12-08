//
//  MovieService.swift
//  CineFlow
//
//  Created by Wagner Rodrigues on 04/12/24.
//

import Foundation

class MovieService {
    private let apiKey = "933255c2dc7f65207853e91995a9a6e0"
    private let baseUrl = "https://api.themoviedb.org/3"
    
    // Função genérica para buscar filmes em endpoints padrão (ex.: "now_playing", "popular")
    func fetchMovies(endpoint: String, completion: @escaping (Result<[MovieSerieModel], Error>) -> Void) {
        guard let url = URL(string: "\(baseUrl)/movie/\(endpoint)?api_key=\(apiKey)&language=pt-BR") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        performRequest(url: url, completion: completion)
    }
    
    // Função dedicada para buscar filmes por gênero
    func fetchMoviesByGenre(genreId: Int, completion: @escaping (Result<[MovieSerieModel], Error>) -> Void) {
            guard let url = URL(string: "\(baseUrl)/discover/movie?api_key=\(apiKey)&language=pt-BR&with_genres=\(genreId)") else {
                completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
                return
            }
            
            performRequest(url: url, completion: completion)
    }
    
    // Função auxiliar para executar requisições HTTP
    private func performRequest(url: URL, completion: @escaping (Result<[MovieSerieModel], Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(decodedResponse.results))
            } catch {
                print("Erro ao decodificar: \(error)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    // Modelo de resposta
    struct MovieResponse: Decodable {
        let results: [MovieSerieModel]
    }
}
