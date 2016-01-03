//
//  Movies.swift
//  MyFavoriteMovies
//
//  Created by Zafer Celaloglu on 2.01.2016.
//  Copyright © 2016 Zafer Celaloglu. All rights reserved.
//

import Foundation
import UIKit

class Movie {

    var image: NSData!
    var title: NSString!
    var review: NSString!
    var imdbURL: NSString!

    init(){

    }

    init(title: String, image: UIImage, review: String, imdburl: String) {
        self.title = title
        self.setMovieImage(image)
        self.review = review
        self.imdbURL = imdburl
    }

    // MARK: - Methods
    func setMovieImage(image: UIImage) {
        let imageData = UIImagePNGRepresentation(image)
        self.image = imageData
    }

    //func setMovieImageFor

    func getMovieImage() -> UIImage {
        let image = UIImage(data: self.image!)!
        return image
    }

}