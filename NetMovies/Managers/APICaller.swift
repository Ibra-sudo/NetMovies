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
}

enum APIError: Error {
    case faildTogetData
}

@MainActor

class ApiCaller: ObservableObject {
    
    static let shared = ApiCaller()
    
//    let persistentContainer: NSPersistentContainer
    
//    init() {
//        persistentContainer = NSPersistentContainer(name: "")
//        persistentContainer.loadPersistentStores { description, error in
//            if let error = error {
//                fatalError("Wrong with fetch ViewModels: \(error.localizedDescription)")
//            }
//        }
//    }
    
    init() {
        
//        getTrendingMovies()
//        getTrendingTvs() { _ in
//
//        }
        
//        let imageView = UIImageView()
//
//        downloadImage("https://image.tmdb.org/t/p/w500/") {
//            image, urlString in
//            if let imageObject = image {
//                DispatchQueue.main.async {
//                    imageView.image = imageObject
//                }
//            }
//        }
    }
    
    @Published var trendingMovies: [Title] = []
    @Published var trendingTv: [Title] = []
    @Published var upcomingMovies: [Title] = []
    @Published var popularMovies: [Title] = []
    @Published var topRatedMovies: [Title] = []
    
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
    
    
//    func downloadImage(_ urlString: String, completion: ((_ image: UIImage?, _ urlString: String?) -> ())?) {
//        guard let url = URL(string: urlString) else {
//            completion?(nil, urlString)
//            return
//        }
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                print("error in downloader image: \(error)")
//                completion?(nil, urlString)
//                return
//            }
////            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
////                completion?(nil, urlString)
////                return
////            }
//            if let data = data, let image = UIImage(data: data) {
//                completion?(image, urlString)
//                return
//            }
//            completion?(nil, urlString)
//        }.resume()
//    }
}
