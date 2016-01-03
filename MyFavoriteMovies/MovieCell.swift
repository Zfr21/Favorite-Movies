//
//  MovieCell.swift
//  MyFavoriteMovies
//
//  Created by Zafer Celaloglu on 2.01.2016.
//  Copyright © 2016 Zafer Celaloglu. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieScore: UILabel!
    @IBOutlet weak var movieIMDBUrl: UILabel!

    // MARK: - Table View Cell
    override func awakeFromNib() {
        super.awakeFromNib()
        //Configure image view to rounded corners
        movieImage.layer.cornerRadius = 6.0
        movieImage.clipsToBounds = true
    }

    // MARK: - Methods
    func configureCell(movie: Movie){
        movieImage.image = movie.getMovieImage()
        movieTitle.text = movie.title
        movieScore.text = movie.score
        movieIMDBUrl.text = movie.imdbURL
    }
}
