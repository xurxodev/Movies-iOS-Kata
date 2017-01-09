//
//  MoviesPresenter.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 9/1/17.
//  Copyright © 2017 xurxodev. All rights reserved.
//

import Foundation

class MoviesPresenter{
    var movieRepository:MovieRepository
    
    var view: MoviesView!
    
    init(movieRepository:MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func attachView(view: MoviesView) -> Void {
        self.view = view
        
        loadMovies()
    }
    
    
    func onRefreshAction() -> Void {
        loadMovies()
    }
    
    private func loadMovies() -> Void {
        
        var movies: [Movie]!
        
        loadingMovies()
        
        DispatchQueue.global(qos: .background).async {
            self.movieRepository = DiskMovieRepository()
            
            movies = self.movieRepository.get()
            
            DispatchQueue.main.async {
                self.loadedMovies(movies: movies)
            }
        }
    }
    
    private func loadingMovies() -> Void {
        view.clearMovies()
        view.showLoadingText()
    }
    
    private func loadedMovies(movies: [Movie]) -> Void {
        view.showMovies(movies: movies)
        view.showTotalMovies(count: movies.count)
    }
}
