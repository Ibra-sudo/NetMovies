//
//  APICaller.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 26.04.23.
//

import Foundation
import CoreData

struct Constants {
    static let API_KEY = "690ecb27ce9f8e42b368dfe2711ee116"
    static let base_url = "https://api.themoviedb.org"
}


class MoviewsViewModel: ObservableObject {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Wrong with fetch ViewModels: \(error.localizedDescription)")
            }
        }
    }
    
    func getTrindingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.base_url)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {
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
                    completion(.success(results.result))
                }
            } catch {
                print("Wrong bei Decoden the response: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    func getTrindingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
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
                    completion(.success(results.result))
                }
            } catch {
                print("Wrong bei Decoden the response: \(error.localizedDescription)")
            }
        }
        task.resume()
    }

    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
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
                    completion(.success(results.result))
                }
            } catch {
                print("Wrong bei Decoden the response: \(error.localizedDescription)")
            }
        }
        task.resume()
    }

    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
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
                    completion(.success(results.result))
                }
            } catch {
                print("Wrong bei Decoden the response: \(error.localizedDescription)")
            }
        }
        task.resume()
    }

    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
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
                    completion(.success(results.result))
                }
            } catch {
                print("Wrong bei Decoden the response: \(error.localizedDescription)")
            }
        }
        task.resume()
    }

}
