//
//  MoviesRobot.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 27/2/17.
//  Copyright © 2017 xurxodev. All rights reserved.
//

import Foundation
import KIF
@testable import MoviesiOSKata

class MoviesRobot:KIFTestActor{
    func getNumMoviesRows() -> Int {
        let moviesTableView = tester().waitForView(withAccessibilityLabel: "MoviesTableView") as! UITableView
        
        let count:Int = moviesTableView.numberOfRows(inSection: 0)
        
        return count
    }
    
    func waitForMovies() -> MoviesRobot {

        let indexPath:IndexPath = IndexPath(row: 1, section: 0)
        
        tester().waitForCell(at: indexPath, inTableViewWithAccessibilityIdentifier: "MoviesTableView")
        
        return self
    }
    
    func getMovieTitle(position:Int) -> String {
        let indexPath:IndexPath = IndexPath(row: 1, section: 0)
        
        let cell = tester().waitForCell(at: indexPath, inTableViewWithAccessibilityIdentifier: "MoviesTableView") as!MovieTableViewCell
        
        return cell.movieTitleLabel.text!
    }
    
    func verifyTextMoviesCount(count:Int) -> Void {
        let textCount = "Movies: " + String(count)
        
        tester().waitForView(withAccessibilityLabel: textCount)
    
    }
    
    
    func refreshMovies() -> MoviesRobot {
        tester().tapView(withAccessibilityLabel: "Refresh")
        
        return self
    }
    
    func verifyLoadingText() -> MoviesRobot {
        let text:String = "loading ...";
        
        tester().waitForView(withAccessibilityLabel: text)
        
        return self
    }
}
