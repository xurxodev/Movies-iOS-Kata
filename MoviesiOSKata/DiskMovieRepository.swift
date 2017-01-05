//
//  DiskMovieRepository.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 2/11/16.
//  Copyright © 2016 xurxodev. All rights reserved.
//

import Foundation

class DiskMovieRepository {
    
    func getMovies() -> [Movie]{
        var movies:[Movie] = []

        let url = Bundle.main.url(forResource: "Movies", withExtension: "json")
        let data = try? Data(contentsOf: url!)
        
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            
            if let moviesjson = json as? [[String: AnyObject]] {
                for moviejson in moviesjson {
                    let movie: Movie = Movie();
                    movie.title = moviejson["title"] as? String
                    movie.image = moviejson["image"] as? String

                    movies.append(movie)
                }
            }
        } catch {
            print("error serializing JSON: \(error)")
        }
        
        simulateDelay()
        
        return movies;
    }
    
    func simulateDelay() -> Void{
        sleep(2)
    }
}
