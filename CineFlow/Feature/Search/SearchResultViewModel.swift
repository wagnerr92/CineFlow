//
//  SearchResultViewModel.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 30/10/24.
//

import Foundation

final class SearchResultViewModel {
    private var releasedMovies: [MovieSerieModel] = [
        MovieSerieModel(title: "Robô Selvagem",
                        posterPath: "\(ApiSettings.imageUrl.rawValue)/pG9Vfb3r0Nwd0QO7g01CNaOowXX.jpg",
                        coverImage: "\(ApiSettings.coverUrl.rawValue)/417tYZ4XUyJrtyZXj7HpvWf1E8f.jpg",
                        sinopse: "Um robô – unidade ROZZUM 7134, abreviadamente “Roz” – naufraga em uma ilha desabitada e deve aprender a se adaptar ao ambiente hostil, gradualmente construindo relacionamentos com os animais da ilha e se tornando o pai adotivo de um filhote de ganso órfão.",
                        genre: "Ação",
                        releaseYear: "202"),
        MovieSerieModel(title: "A Substância",
                        posterPath: "\(ApiSettings.imageUrl.rawValue)/6L3PfQEydRzONYrhtpWtchRhOuV.jpg",
                        coverImage: "\(ApiSettings.coverUrl.rawValue)/7h6TqPB3ESmjuVbxCxAeB1c9OB1.jpg",
                        sinopse: "Após ser demitida da TV por ser considerada “velha demais” para sua atriz, Elisabeth Sparkle recorre a um sinistro programa de aprimoramento corporal. A substância milagrosa promete rejuvenescê-la, mas resulta em uma transformação ainda mais radical. Ela agora precisa dividir seu corpo com Sue, sua versão jovem e melhorada, e, aos poucos, começa a perder completamente o controle da própria vida. Em um pesadelo surreal sobre a busca incessante pela juventude, A Substância revela o preço oculto da perfeição.", genre: "Animação",
                        releaseYear: "202"),
        MovieSerieModel(title: "Azrael",
                        posterPath: "\(ApiSettings.imageUrl.rawValue)/qpdFKDvJS7oLKTcBLXOaMwUESbs.jpg",
                        coverImage: "\(ApiSettings.coverUrl.rawValue)/4KHEK6AQFHhv4TDtL3KLReePB05.jpg",
                        sinopse: "Em um mundo onde ninguém fala, um culto fanático caça uma jovem que escapou de seu aprisionamento. Recapturada por seus líderes implacáveis, Azrael está destinada a ser sacrificada para aplacar um antigo mal.",
                        genre: "Animação",
                        releaseYear: "202"),
        MovieSerieModel(title: "O Poço 2",
                        posterPath: "\(ApiSettings.imageUrl.rawValue)/2fJn438T3W2XDlyBlgNuAeAAHrj.jpg",
                        coverImage: "\(ApiSettings.coverUrl.rawValue)/3m0j3hCS8kMAaP9El6Vy5Lqnyft.jpg",
                        sinopse: "Após um líder misterioso impor sua própria lei em um sistema brutal de celas verticais, uma mulher luta contra um método bizarro de distribuição de comida.", genre: "Animação",
                        releaseYear: "202"),
        MovieSerieModel(title: "Terrifier 3",
                        posterPath: "\(ApiSettings.imageUrl.rawValue)/gU9ubNnaDKYBxs1DCSfiUIqHSMR.jpg",
                        coverImage: "\(ApiSettings.coverUrl.rawValue)/eQEgKIRF7KeVGBQ8IYcklpU8RPf.jpg",
                        sinopse: "O palhaço assassino Art está pronto para espalhar o caos sobre os moradores inocentes do Condado de Miles durante uma pacífica véspera de Natal.", genre: "Animação",
                        releaseYear: "202"),
    ]
    
    public func numberOfRowsInSection() -> [MovieSerieModel] {
        return releasedMovies
    }
    
    public func getReleaseMoviesList(indexpath: IndexPath) -> MovieSerieModel {

        return releasedMovies[indexpath.row]
    }
}
