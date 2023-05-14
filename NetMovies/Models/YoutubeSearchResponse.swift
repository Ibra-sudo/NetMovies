//
//  YoutubeSearchResponse.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 14.05.23.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
