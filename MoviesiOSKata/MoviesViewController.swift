//
//  MoviesViewController.swift
//  MoviesiOSKata
//
//  Created by Jorge Sánchez on 3/1/17.
//  Copyright © 2017 xurxodev. All rights reserved.
//

import UIKit
import SDWebImage

class MoviesViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{

    var movieRepository:DiskMovieRepository!
    var movies = [Movie]()
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func refreshClicked(_ sender: UIButton) {
        loadMovies()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moviesTableView.tableFooterView = UIView()
        moviesTableView.dataSource = self;
        
        loadMovies()
    }
    
    func loadMovies() {
        loadingMovies()
        
        DispatchQueue.global(qos: .background).async {
            self.movieRepository = DiskMovieRepository()
            
            self.movies = self.movieRepository.getMovies()
            
            DispatchQueue.main.async {
                self.loadedMovies()
            }
        }
    }
    
    func loadingMovies(){
        movies.removeAll()
        moviesTableView.reloadData()
        titleLabel.text = "loading ..."
    }
    
    func loadedMovies(){
        moviesTableView.reloadData()
        titleLabel.text = "Movies: " + String(movies.count)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)as! MovieTableViewCell
        
        let movie:Movie = movies[indexPath.item]
        cell.movieTitleLabel.text = movie.title;
        cell.movieImageView.sd_setImage(with: URL(string: movie.image!))
        
        
        return cell
    }
    

}
