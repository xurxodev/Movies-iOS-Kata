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
    
    var movieRepository:MovieRepository!
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
        
        loadMovies()
    }
    
    func setMovieRepository(_ movieRepository:MovieRepository){
        self.movieRepository = movieRepository
    }
    
    func loadMovies() {
        movies = movieRepository.get()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)as! MovieTableViewCell
        
        let movie:Movie = movies[indexPath.item]
        cell.MovieTitleLabel.text = movie.title;
        cell.MovieImageView.sd_setImage(with: URL(string: movie.image!))
    
        
        return cell
    }
    
}
