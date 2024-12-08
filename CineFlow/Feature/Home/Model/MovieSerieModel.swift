//
//  CoverModel.swift
//  CineFlow
//
//  Created by Rodrigo Ventura on 19/09/24.
//

import UIKit

//struct MovieSerieModel {
//    var title: String
//    var posterPath: String
//    var coverImage: String
//    var sinopse: String
//    var genre: String
//    var releaseYear: String
//}

struct MovieSerieModel: Decodable {
    let id: Int
    let title: String
    let originalTitle: String
    let overview: String
    let posterPath: String
    let backdropPath: String?
    let genreIds: [Int]
    let releaseYear: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case releaseYear = "release_date"
        case voteAverage = "vote_average"
    }
}



