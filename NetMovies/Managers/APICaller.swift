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
    var movies: [Title] = []
    
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
            
            DispatchQueue.main.async {
            
            do {
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(results)
//                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)

//                DispatchQueue.main.async {
                    let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)

//                    completion(.success(results.results))
                    self.movies = results.results
//                    print(results.results[2].poster_path)
//                }

            } catch {
                print("Wrong bei Decoden the response: \(APIError.faildTogetData)")
            }
            
                
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
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
                    completion(.success(results.results))
//                    print(results)
                }
            } catch {
                print("Wrong bei Decoden the response: \(APIError.faildTogetData)")
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
                    completion(.success(results.results))
                }
            } catch {
                print("Wrong bei Decoden the response: \(APIError.faildTogetData)")
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
                    completion(.success(results.results))
                }
            } catch {
                print("Wrong bei Decoden the response: \(APIError.faildTogetData)")
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
                    completion(.success(results.results))
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


// Images https://image.tmdb.org/t/p/w500




/*

 import Foundation

 protocol CollectionViewTableViewCellDelegate: AnyObject {
     func collectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, viewModel: TitlePreviewViewModel)
 }

 class CollectionViewTableViewCell: NSObject {
     
     static let identifier = "CollectionViewTableViewCell"
     
     weak var delegate: CollectionViewTableViewCellDelegate?
     
     private var titles: [Title] = []
     
     private let collectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.itemSize = CGSize(width: 140, height: 200)
         layout.scrollDirection = .horizontal
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
         return collectionView
     }()
     
     override init() {
         super.init()
         collectionView.delegate = self
         collectionView.dataSource = self
     }
     
     func configure(with titles: [Title]) {
         self.titles = titles
         DispatchQueue.main.async { [weak self] in
             self?.collectionView.reloadData()
         }
     }
     
     private func downloadTitleAt(indexPath: IndexPath) {
         DataPersistenceManager.shared.downloadTitleWith(model: titles[indexPath.row]) { result in
             switch result {
             case .success():
                 NotificationCenter.default.post(name: NSNotification.Name("downloaded"), object: nil)
             case .failure(let error):
                 print(error.localizedDescription)
             }
         }
     }
 }

 extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
             return UICollectionViewCell()
         }
         
         guard let model = titles[indexPath.row].poster_path else {
             return UICollectionViewCell()
         }
         cell.configure(with: model)
         
         return cell
     }
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return titles.count
     }
     
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         collectionView.deselectItem(at: indexPath, animated: true)
         
         let title = titles[indexPath.row]
         guard let titleName = title.original_title ?? title.original_name else {
             return
         }
         APICaller.shared.getMovie(with: titleName + " trailer") { [weak self] result in
             switch result {
             case .success(let videoElement):
                 
                 let title = self?.titles[indexPath.row]
                 guard let titleOverview = title?.overview else {
                     return
                 }
                 guard let strongSelf = self else {
                     return
                 }
                 let viewModel = TitlePreviewViewModel(title: titleName, youtubeView: videoElement, titleOverview: titleOverview)
                 self?.delegate?.collectionViewTableViewCellDidTapCell(strongSelf, viewModel: viewModel)
                 
             case .failure(let error):
                 print(error.localizedDescription)
             }
         }
     }
     
     func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
         
         let config = UIContextMenuConfiguration(
             identifier: nil,
             previewProvider: nil) {[weak self] _ in
                 let downloadAction = UIAction(title: "Download", image: nil, identifier: nil, discoverabilityTitle: nil, state: .off) { _ in
                     self?.downloadTitleAt(indexPath: indexPath)
                 }
                 return UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [downloadAction])
             }
         return config
     }
 }

 */
