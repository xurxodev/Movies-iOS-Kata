//
//  MovieRepository.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 5/1/17.
//  Copyright © 2017 xurxodev. All rights reserved.
//

import Foundation

protocol MovieRepository {
    func get() -> [Movie]
}
