//
//  MovieDetailVC.swift
//  MyFavoriteMovies
//
//  Created by Zafer Celaloglu on 2.01.2016.
//  Copyright © 2016 Zafer Celaloglu. All rights reserved.
//

import UIKit

class MovieDetailVC: UIViewController {

    var movie: Movie!
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieScore: UILabel!
    @IBOutlet weak var movieDescription: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        if  let movie = movie {
            movieImg.layer.cornerRadius = 6.0
            movieImg.clipsToBounds = true

            movieImg.image = movie.getMovieImage()
            movieTitle.text = movie.title
            movieScore.text = movie.score
            movieDescription.text = movie.reason
        }
    }
}
