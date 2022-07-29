//
//  MovieDetailPresenter.swift
//  MovieReview
//
//  Created by kid cherish on 2022/07/10.
//

import Foundation

protocol MovieDetailProtocol: AnyObject {
    func setViews(with movie: Movie)
    func setRightBarButton(with isLiked: Bool)
}

final class MovieDetailPresenter {
    private weak var viewController: MovieDetailProtocol?
    private let userDefaultsManager: UserDefaultsManagerProtocol
    
    private var movie: Movie
    
    init(
        viewController: MovieDetailProtocol,
        userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager(),
        movie: Movie
    ) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
        self.movie = userDefaultsManager.findMovie(movie) ?? movie
    }
    
    func viewDidLoad() {
        viewController?.setViews(with: movie)
        viewController?.setRightBarButton(with: movie.isLiked)
    }
    
    func didTapRightBarButtonItem() {
        movie.isLiked.toggle()
        
        if movie.isLiked {
            userDefaultsManager.addMovie(movie)
        } else {
            userDefaultsManager.removeMovie(movie)
        }
        
        viewController?.setRightBarButton(with: movie.isLiked)
    }
}
