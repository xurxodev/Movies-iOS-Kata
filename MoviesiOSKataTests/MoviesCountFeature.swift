//
//  MoviesiOSKataTests.swift
//  MoviesiOSKataTests
//
//  Created by Jorge Sánchez on 1/11/16.
//  Copyright © 2016 xurxodev. All rights reserved.
//

import XCTest

class MoviesCountFeature: XCTestCase {
    
    func testShowCountTextEqualToRowsCount() {
        let moviesScreen = moviesRobot()
        
        moviesScreen.waitForMovies()
        
        let numMovies = moviesScreen.getNumMoviesRows()
        
        moviesScreen.verifyTextMoviesCount(count: numMovies)
    }
    
}
