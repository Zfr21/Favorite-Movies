//
//  Movies.swift
//  MyFavoriteMovies
//
//  Created by Zafer Celaloglu on 2.01.2016.
//  Copyright © 2016 Zafer Celaloglu. All rights reserved.
//

import Foundation
import UIKit

class Movies: NSObject, NSCoding {

    var _image: NSData!
    var _title: String!
    var _score: String!
    var _description: String!
    var _imdbURL: String!

    var image: NSData{
      return _image
    }

    var title: String{
        return _title
    }

    var score: String{
        return _score
    }

    override var description: String{
        return _description
    }

    var imdbUrl: String{
        return _imdbURL
    }

    init(title: String, image: UIImage, score: String, description: String, imdburl: String) {
        super.init()
        self._title = title
        self.setMovieImage(image)
        self._score = score
        self._description = description
        self._imdbURL = imdburl
    }

    override init() {

    }
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._image = aDecoder.decodeObjectForKey("image") as? NSData
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._score = aDecoder.decodeObjectForKey("score") as? String
        self._description = aDecoder.decodeObjectForKey("description") as? String
        self._imdbURL = aDecoder.decodeObjectForKey("imdburl") as? String
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._image, forKey: "image")
        aCoder.encodeObject(self._title, forKey: "title")
        aCoder.encodeObject(self._score, forKey: "score")
        aCoder.encodeObject(self._description, forKey: "description")
        aCoder.encodeObject(self._imdbURL, forKey: "imdburl")
    }

    // MARK: - Methods
    func setMovieImage(image: UIImage) {
        let imageData = UIImagePNGRepresentation(image)
        self._image = imageData
    }

    //func setMovieImageFor

    func getMovieImage() -> UIImage {
        let image = UIImage(data: self._image!)!
        return image
    }

}