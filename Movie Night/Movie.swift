//
//  Movie.swift
//  Movie Night
//
//  Created by Fathureza Januarza on 8/2/16.
//  Copyright © 2016 tedihouse. All rights reserved.
//

import Foundation
//import UIKit

class Movie: NSObject, NSCoding{
    
    fileprivate var _movieTitle: String!
    fileprivate var _movieStudio: String!
    fileprivate var _movieImagePath: String!
    fileprivate var _movieImbdLink: String!
    
    var movieTitle: String{
        return _movieTitle
    }
    var movieStudio: String{
        return _movieStudio
    }
    var movieImagePath: String{
        return _movieImagePath
    }
    var movieImdbLink: String{
        return _movieImbdLink
    }
    
    init(title: String, studio: String, imgPath: String, imdbLink: String){
        self._movieTitle = title
        self._movieStudio = studio
        self._movieImagePath = imgPath
        self._movieImbdLink = imdbLink
    }
    override init(){
        
    }
    
    //codedecode
    required convenience init?(coder aDecoder:NSCoder){
        self.init()
        self._movieTitle = aDecoder.decodeObject(forKey: "title") as? String
        self._movieStudio = aDecoder.decodeObject(forKey: "studio") as? String
        self._movieImagePath = aDecoder.decodeObject(forKey: "imgPath") as? String
        self._movieImbdLink = aDecoder.decodeObject(forKey: "imdbLink") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._movieTitle, forKey: "title")
        aCoder.encode(self._movieStudio, forKey: "studio")
        aCoder.encode(self._movieImagePath, forKey: "imgPath")
        aCoder.encode(self.movieImdbLink, forKey: "imdbLinl")
    }
}
