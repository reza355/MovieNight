//
//  AddMovie.swift
//  Movie Night
//
//  Created by Fathureza Januarza on 8/2/16.
//  Copyright © 2016 tedihouse. All rights reserved.
//

import UIKit


class AddMovie: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var postMovieImg: UIImageView!
    @IBOutlet weak var movieTitleField: UITextField!
    @IBOutlet weak var movieStudioField: UITextField!
    @IBOutlet weak var movieImdbLinkField: UITextField!
    
    var imagePicker : UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        self.movieTitleField.delegate = self
        self.movieStudioField.delegate = self
        self.movieImdbLinkField.delegate = self
    }
    
    //add picture from gallery
    

    @IBAction func AddPicOnPressed(_ sender: AnyObject) {
        sender.setTitle("", for: [])
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        postMovieImg.image = image
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPostOnPressed(_ sender: AnyObject) {
        //dismiss(animated: true, completion: nil)
        if let title = movieTitleField.text, let studio = movieStudioField.text, let imdblink = movieImdbLinkField.text, let img = postMovieImg.image{
            let imgPath = DataService.instance.saveImageAndCreatePath(image: img)
            let post = Movie(title: title, studio: studio, imgPath: imgPath, imdbLink: imdblink)
            DataService.instance.addPost(post: post)
            print(title, studio, imdblink, img) //printresult
            navigationController?.popViewController(animated: true)

        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
