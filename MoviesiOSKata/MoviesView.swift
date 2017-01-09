//
//  MoviesView.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 9/1/17.
//  Copyright © 2017 xurxodev. All rights reserved.
//

import Foundation

protocol MoviesView {
    func showMovies(movies: [Movie]) -> Void
    func clearMovies() ->  Void
    func showLoadingText() ->  Void
    func showTotalMovies(count: Int) ->  Void
}
