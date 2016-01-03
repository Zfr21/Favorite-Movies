//
//  DataService.swift
//  MyFavoriteMovies
//
//  Created by Zafer Celaloglu on 2.01.2016.
//  Copyright © 2016 Zafer Celaloglu. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataService {
    // MARK: - Singleton
    static let instance = DataService()

    // MARK: - Constants
    let KEY_ENTITY = "movie" //coredata entity key

    private var _movies = [Movie]()

    var movies: [Movie] {
        get {
            return _movies
        }
        set {
            _movies = newValue
        }
    }

    func deleteMovie(index: Int, var movieArray: [Movie]) {

        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context: NSManagedObjectContext = appDel.managedObjectContext
        context.deleteObject(movieArray[index] as NSManagedObject)
        movieArray.removeAtIndex(index)

        do {
            try context.save()
        } catch {
            print("Could not save movie.")
        }
    }
}
