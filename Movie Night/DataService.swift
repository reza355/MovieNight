//
//  DataService.swift
//  Movie Night
//
//  Created by Fathureza Januarza on 8/2/16.
//  Copyright © 2016 tedihouse. All rights reserved.
//

import Foundation
import UIKit

class DataService{
    
    let KEY_POST = "MoviePost"
    static let instance = DataService()
    
    private var _loadedPost = [Movie]()
    
    var loadedPost: [Movie]{
        return _loadedPost
    }
    
    func savePost(){
        let postData = NSKeyedArchiver.archivedData(withRootObject: _loadedPost)
        UserDefaults.standard().object(forKey: KEY_POST)
        UserDefaults.standard().synchronize()
    }
    
    func loadPost(){
        if let postData = UserDefaults.standard().object(forKey: KEY_POST) as? NSData{
            if let postArray = NSKeyedUnarchiver.unarchiveObject(with: postData as Data) as? [Movie]{
                _loadedPost = postArray
            }
        }
        NotificationCenter.default().post(NSNotification(name: "loadedpost" as NSNotification.Name, object: nil) as Notification)
    }
    
    func addPost(post: Movie){
        _loadedPost.append(post)
        savePost()
        loadPost()
    }
    
    //SaveImage
    
    func documentPathForFileName(name: String) -> String{
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.appendingPathComponent(name)
    }
    
    func imageForPath(path: String) -> UIImage?{
        let fullPath = documentPathForFileName(name: path)
        let image =  UIImage(named: fullPath)
        return image
    }
    
    func saveImageAndCreatePath(image: UIImage) -> String{
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentPathForFileName(name: imgPath)
        let fileUrl = NSURL(fileURLWithPath: fullPath)
        do {
            try imgData?.write(to: fileUrl as URL)
        } catch let err as NSError {
            print(err.debugDescription)
        }
        return imgPath
    }
    
}

