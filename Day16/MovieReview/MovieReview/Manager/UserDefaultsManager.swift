//
//  UserDefaultsManager.swift
//  MovieReview
//
//  Created by kid cherish on 2022/07/10.
//

import Foundation

protocol UserDefaultsManagerProtocol {
    func getMovies() -> [Movie]
    func addMovie(_ newValue: Movie)
    func removeMovie(_ value: Movie)
    func findMovie(_ value: Movie) -> Movie?
}

//    extension UserDefaultsManagerProtocol {
//        func ifNeeded(_ value: Movie) {}
//    }

struct UserDefaultsManager: UserDefaultsManagerProtocol {
    enum Key: String {
        case movie
    }
    
    func getMovies() -> [Movie] {
        guard let data = UserDefaults.standard.data(forKey: Key.movie.rawValue) else { return [] }
        
        return (try? PropertyListDecoder().decode([Movie].self, from: data)) ?? []
    }
    
    func addMovie(_ newValue: Movie) {
        var currentMovies: [Movie] = getMovies()
        currentMovies.insert(newValue, at: 0)
        
        saveMovie(currentMovies)
    }
    
    func removeMovie(_ value: Movie) {
        let currentMovies: [Movie] = getMovies()
        let newCurrentMovies = currentMovies.filter { $0.title != value.title }
        
        saveMovie(newCurrentMovies)
    }

    func findMovie(_ value: Movie) -> Movie? {
        let currentMovies: [Movie] = getMovies()
        var currentMovie = currentMovies.filter { $0.title == value.title }

        guard !currentMovie.isEmpty else { return nil }
        currentMovie[0].isLiked = true
        
        return currentMovie[0]
    }
    
    private func saveMovie(_ newValue: [Movie]) {
        UserDefaults.standard.set(
            try? PropertyListEncoder().encode(newValue),
            forKey: Key.movie.rawValue
        )
    }
}
