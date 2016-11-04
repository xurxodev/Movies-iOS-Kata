//
//  MoviesRepository.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 3/11/16.
//  Copyright © 2016 xurxodev. All rights reserved.
//

import Foundation

protocol MoviesRepository {
    func getMovies() -> [Movie]
}