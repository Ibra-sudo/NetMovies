//
//  APICaller.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 26.04.23.
//

import Foundation
import UIKit
//import CoreData

struct Constants {
    static let API_KEY = "690ecb27ce9f8e42b368dfe2711ee116"
    static let base_url = "https://api.themoviedb.org"
    static let youtube_API_KEY = "AIzaSyDaOIyZjCWyo29ifMCMvQdlIBsTptCO0FY"
    static let youtube_base_url = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
    case faildTogetData
}

@MainActor

class ApiCaller: ObservableObject {
    
    init() {
//        getTrendingMovies()
//        getYoutubeMovie(with: "Hulk")
    }
    
    @Published var trendingMovies: [Title] = []
    @Published var trendingTv: [Title] = []
    @Published var upcomingMovies: [Title] = []
    @Published var popularMovies: [Title] = []
    @Published var topRatedMovies: [Title] = []
    @Published var titles: [Title] = []
    @Published var youtubeTitle: [VideoElement] = []
    
    func getTrendingMovies() {
        guard let url = URL(string: "\(Constants.base_url)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Wrong with fitching the response: \(String(describing: error?.localizedDescription))")
                print("data = \(String(describing: data))")
                print("error = \(String(describing: error))")
                return
            }
            
            do {
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(results)
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)

                DispatchQueue.main.async {
//                    completion(.success(results.results))
                    self.trendingMovies = results.results
//                    print(results.results[2].poster_path)
                }

            } catch {
                print("Wrong bei Decoden the response: \(APIError.faildTogetData)")
            }
        }
        task.resume()
    }
    
    func getTrendingTvs() {
        guard let url = URL(string: "\(Constants.base_url)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Wrong with fitching the response: \(String(describing: error?.localizedDescription))")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                DispatchQueue.main.async {
//                    completion(.success(results.results))
                    self.trendingTv = results.results
//                    print(results)
                }
            } catch {
                print("Wrong bei Decoden the response: \(APIError.faildTogetData)")
            }
        }
        task.resume()
    }

    
    func getUpcomingMovies() {
        guard let url = URL(string: "\(Constants.base_url)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Wrong with fitching the response: \(String(describing: error?.localizedDescription))")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                DispatchQueue.main.async {
//                    completion(.success(results.results))
                    self.upcomingMovies = results.results
                }
            } catch {
                print("Wrong bei Decoden the response: \(APIError.faildTogetData)")
            }
        }
        task.resume()
    }

    func getPopularMovies() {
        guard let url = URL(string: "\(Constants.base_url)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Wrong with fitching the response: \(String(describing: error?.localizedDescription))")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                DispatchQueue.main.async {
//                    completion(.success(results.results))
                    self.popularMovies = results.results
                }
            } catch {
                print("Wrong bei Decoden the response: \(APIError.faildTogetData)")
            }
        }
        task.resume()
    }

    func getTopRatedMovies() {
        guard let url = URL(string: "\(Constants.base_url)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Wrong with fitching the response: \(String(describing: error?.localizedDescription))")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                DispatchQueue.main.async {
//                    completion(.success(results.results))
                    self.topRatedMovies = results.results
                }
            } catch {
                print("Wrong bei Decoden the response: \(APIError.faildTogetData)")
            }
        }
        task.resume()
    }
    
    func search(with query: String) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Constants.base_url)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, rsponse, error in
            guard let data = data, error == nil else {
                print("Wrong with fitching the response: \(String(describing: error?.localizedDescription))")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                DispatchQueue.main.async {
                    self.titles = results.results
//                    print(results)
                }
            } catch {
                print("Wrong bei searching: \(APIError.faildTogetData)")
            }
        }
        task.resume()
    }
    
    func getYoutubeMovie(with query: String) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Constants.youtube_base_url)q=\(query)&key=\(Constants.youtube_API_KEY)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, rsponse, error in
            guard let data = data, error == nil else {
                print("Wrong with fitching the response: \(String(describing: error?.localizedDescription))")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                DispatchQueue.main.async {
                    self.youtubeTitle = results.items
//                    print(results)
                }
            } catch {
                print("Wrong bei searching: \(APIError.faildTogetData)")
            }
        }
        task.resume()
    }
}
