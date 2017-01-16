//
//  MoviesPresenter.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 9/1/17.
//  Copyright © 2017 xurxodev. All rights reserved.
//

import Foundation

class MoviesPresenter:GetMoviesUseCaseHandler{
    var getMoviesUseCase:GetMoviesUseCase
    
    var view: MoviesView!
    
    init(getMoviesUseCase:GetMoviesUseCase) {
        self.getMoviesUseCase = getMoviesUseCase
    }
    
    func attachView(view: MoviesView) -> Void {
        self.view = view
        
        loadMovies()
    }
    
    func onRefreshAction() -> Void {
        loadMovies()
    }
    
    private func loadMovies() -> Void {
        loadingMovies()
        
        getMoviesUseCase.execute(handler: self)
    }
    
    func onMoviesLoaded(movies: [Movie]) -> Void{
        loadedMovies(movies: movies)
    }
    
    func onConnectionError() ->  Void{
        view.showConnectionError();
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

protocol MoviesView {
    func showMovies(movies: [Movie]) -> Void
    func clearMovies() ->  Void
    func showLoadingText() ->  Void
    func showTotalMovies(count: Int) ->  Void
    func showConnectionError() ->  Void
}


