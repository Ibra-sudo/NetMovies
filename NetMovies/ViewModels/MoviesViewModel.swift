//
//  MoviesViewModel.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 05.05.23.
//

import Foundation
import CoreData

class MoviesViewModel: ObservableObject {
    
    let persistentContainer: NSPersistentContainer
    
    @Published var savedMovies: [MoviesItem] = []
    
    init () {
        persistentContainer = NSPersistentContainer(name: "NetMoviesDataModel")
        
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data store faild to load with error: \(error.localizedDescription)")
            }
            print("loadPersistenStores was successful!")
        }
        fetchMovies()
    }
    
    func fetchMovies() {
        
        let request = NSFetchRequest<MoviesItem>(entityName: String(describing: MoviesItem.self))
        
        do {
            savedMovies = try persistentContainer.viewContext.fetch(request)
        } catch {
            print("Error while fetching MoviesItem \(error.localizedDescription)")
        }
    }
    
    func saveMovies(id: Int64, title: String, media_type: String, original_title: String, poster_path: String, overview: String, vote_count: Int64, relase_date: String, vote_average: Double) {
        
        let newMovie = MoviesItem(context: persistentContainer.viewContext)
        
        newMovie.id = id
        newMovie.title = title
        newMovie.media_type = media_type
        newMovie.original_title = original_title
        newMovie.poster_path = poster_path
        newMovie.overview = overview
        newMovie.vote_count = vote_count
        newMovie.relase_date = relase_date
        newMovie.vote_average = vote_average
        
        do {
            try persistentContainer.viewContext.save()
            fetchMovies()
        } catch {
            print("Error while saving a new Movie!")
        }
    }
    
    func deleteMovie(indexSet: IndexSet) {
        guard let index = indexSet.first else {
            print("No index inside IndexSet")
            return
        }
        
        let movieToDelete = savedMovies[index]
        persistentContainer.viewContext.delete(movieToDelete)
        
        do {
            try persistentContainer.viewContext.save()
            fetchMovies()
        } catch {
            print("Error while deleting a Movie \(error.localizedDescription)")
        }
    }
}
