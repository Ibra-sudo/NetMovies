//
//  YoutubeSearchResponse.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 14.05.23.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    var items: [VideoElement]
}

struct VideoElement: Codable {
    var id: IdVideoElement = IdVideoElement()
}

struct IdVideoElement: Codable {
    var kind: String = ""
    var videoId: String = ""
}
