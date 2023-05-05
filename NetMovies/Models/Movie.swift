//
//  Movie.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 05.05.23.
//

import Foundation


struct TrendingMoviesResponse: Codable {
    let result: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String
    let original_name: String
    let original_title: String
    let poster_path: String
    let overview: String
    let vote_count: Int
    let relase_date: String
    let vote_average: Double
}
