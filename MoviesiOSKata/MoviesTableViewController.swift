//
//  MoviesTableViewController.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 2/11/16.
//  Copyright © 2016 xurxodev. All rights reserved.
//

import UIKit
import SDWebImage



class MovieTableViewHeader: UITableViewCell {
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBAction func RefreshButton(_ sender: UIButton) {
    }
    
    
}

class MoviesTableViewController: UITableViewController {
    
    var movieRepository:DiskMovieRepository!
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
        self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        self.tableView.estimatedSectionHeaderHeight = 25
        
        loadMovies()
    }
    
    func loadMovies() {
        movies = DiskMovieRepository().getMovies()
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
        cell.movieTitleLabel.text = movie.title;
        cell.movieImageView.sd_setImage(with: URL(string: movie.image!))
    
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell")as! MovieTableViewHeader
        
        headerCell.TitleLabel.text = "Movies: " + String(movies.count)
        
        return headerCell
    }
    
}
