//
//  MoviesLoadingTextFeature.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 28/2/17.
//  Copyright © 2017 xurxodev. All rights reserved.
//

import XCTest

class MoviesLoadingTextFeature: XCTestCase {
    
    func testShowLoadingTextWhileRetrieveMovies() {
        let moviesScreen = moviesRobot()

        moviesScreen
            .waitForMovies()
            .refreshMovies()
            .verifyLoadingText()

    }
}
