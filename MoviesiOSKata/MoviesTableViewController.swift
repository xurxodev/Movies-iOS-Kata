//
//  MoviesTableViewController.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 2/11/16.
//  Copyright © 2016 xurxodev. All rights reserved.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var MovieTitleLabel: UILabel!
    
    @IBOutlet weak var MovieImageView: UIImageView!
}

class MoviesTableViewController: UITableViewController {
    
    var movieRepository:DiskMovieRepository!
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
        
        loadMovies()
    }
    
    func loadMovies() {
        movieRepository = DiskMovieRepository()
        movies = DiskMovieRepository().getMovies()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath)as! MovieTableViewCell
        
        let movie:Movie = movies[indexPath.item]
        cell.MovieTitleLabel.text = movie.title;
        cell.MovieImageView.sd_setImageWithURL(NSURL(string: movie.image!))
    
        
        return cell
    }
    
}