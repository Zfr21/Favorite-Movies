//
//  MovieVC.swift
//  MyFavoriteMovies
//
//  Created by Zafer Celaloglu on 2.01.2016.
//  Copyright © 2016 Zafer Celaloglu. All rights reserved.
//

import UIKit
import CoreData

class MovieVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    var movieArray = DataService.instance.movies

    // MARK: - View Controller
    override func viewDidLoad() {

        tableView.delegate = self
        tableView.dataSource = self
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }

    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }

    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movie")

        do{
            let results = try context.executeFetchRequest(fetchRequest)
            movieArray = results as! [Movie]
        } catch let error as NSError {
            print(error.debugDescription)
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell{
            let movie = movieArray[indexPath.row]
            cell.configureCell(movie)
            return cell
        } else {
            return MovieCell()
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var movie: Movie!

        movie = movieArray[indexPath.row]
        print("This is the movie selected: \(movie)")
        performSegueWithIdentifier("DetailVC", sender: movie)
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete) {

            //DataService.instance.deleteMovie(indexPath.row, movieArray: movieArray)
            let removedIndex = indexPath.row

            let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
            let context: NSManagedObjectContext = appDel.managedObjectContext
            context.deleteObject(movieArray[removedIndex] as NSManagedObject)
            movieArray.removeAtIndex(removedIndex)

            do {
                try context.save()
            } catch {
                print("Could not save movie.")
            }

            let indexPath = NSIndexPath(forItem: indexPath.row, inSection: 0)

            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)

            tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailVC" {
            if let detailVC = segue.destinationViewController as? MovieDetailVC {
                if let movie = sender as? Movie {
                    print("sending movie to detailvc \(movie)")
                    detailVC.movie = movie
                }
            }
        }
    }
}

