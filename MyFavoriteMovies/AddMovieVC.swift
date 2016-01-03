//
//  AddMovieVC.swift
//  MyFavoriteMovies
//
//  Created by Zafer Celaloglu on 2.01.2016.
//  Copyright © 2016 Zafer Celaloglu. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleField: UITextField!
    @IBOutlet weak var movieScoreField: UITextField!
    @IBOutlet weak var movieImdbUrlField: UITextField!
    @IBOutlet weak var movieReasonField: UITextField!
    @IBOutlet weak var addMovieBtn: UIButton!
    @IBOutlet weak var addImageBtn: UIButton!

    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieImageView.layer.cornerRadius = 6.0
        movieImageView.clipsToBounds = true

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.dismissViewControllerAnimated(true, completion: nil)
        movieImageView.image = image
    }

    @IBAction func addImageBtnPressed(sender: AnyObject) {
        self.presentViewController(imagePicker, animated: true, completion: nil)
        addImageBtn.hidden = true
    }
    
    @IBAction func addMovieBtnPressed(sender: AnyObject) {

        if let title = movieTitleField.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)

            movie.title = title
            movie.score = movieScoreField.text
            movie.imdbURL = movieImdbUrlField.text
            movie.setMovieImage(movieImageView.image!)
            movie.reason = movieReasonField.text

            context.insertObject(movie)

            do {
                try context.save()
            } catch {
                print("Could not save movie.")
            }
            self.navigationController?.popViewControllerAnimated(true)

        }
    }
}
