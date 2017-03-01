//
//  XCTestCase.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 28/2/17.
//  Copyright © 2017 xurxodev. All rights reserved.
//

import Foundation
import KIF

extension XCTestCase {
    func moviesRobot() -> MoviesRobot {
        return MoviesRobot(inFile: #file, atLine: #line, delegate: self)!
    }
    
}
