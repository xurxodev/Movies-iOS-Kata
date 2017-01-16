//
//  MoviesUseCase.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 12/1/17.
//  Copyright © 2017 xurxodev. All rights reserved.
//

import Foundation

class GetMoviesUseCase{
    var movieRepository:MovieRepository
    
    init(movieRepository:MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func execute(handler: GetMoviesUseCaseHandler) -> Void {
        
        DispatchQueue.global(qos: .background).async {
            let movies = self.movieRepository.get()
            
            DispatchQueue.main.async {
                if (movies.count != 0){
                    handler.onMoviesLoaded(movies: movies)
                }
                else{
                    handler.onConnectionError()
                }
            }

        }
    }
}

protocol GetMoviesUseCaseHandler {
    func onMoviesLoaded(movies: [Movie]) -> Void
    func onConnectionError() ->  Void
}
