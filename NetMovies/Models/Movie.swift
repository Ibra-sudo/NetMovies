//
//  Movie.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 05.05.23.
//

import Foundation


struct TrendingMoviesResponse: Codable {
    var results: [Title]
}

struct Title: Codable, Identifiable {
    var id: Int
    var media_type: String?
    var title: String?
    var original_title: String?
    var poster_path: String?
    var overview: String?
    var vote_count: Int
    var relase_date: String?
    var vote_average: Double
}
