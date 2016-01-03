//
//  Movie.swift
//  MyFavoriteMovies
//
//  Created by Zafer Celaloglu on 2.01.2016.
//  Copyright © 2016 Zafer Celaloglu. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movie: NSManagedObject {

    // MARK: - Methods
    func setMovieImage(image: UIImage) {
        self.image = UIImagePNGRepresentation(image)
    }

    func getMovieImage() -> UIImage {
        return UIImage(data: self.image!)!
    }
}
