//
//  mainVC.swift
//  Movie Night
//
//  Created by Fathureza Januarza on 8/1/16.
//  Copyright © 2016 tedihouse. All rights reserved.
//

import UIKit

class mainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var movieTableView: UITableView!
    
    //var MovieList = [Movie]()
    override func viewDidLoad() {
        super.viewDidLoad()

        //setFont
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "AcademyEngravedLetPlain", size: 23)!]
        //dataservice
        DataService.instance.loadPost()
        NotificationCenter.default.addObserver(self, selector: #selector(onPostLoaded), name: NSNotification.Name(rawValue: "loadedPost"), object: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
       movieTableView.reloadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPost.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let posts = DataService.instance.loadedPost[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell") as? MovieListCell{
            cell.configurePost(posts)
            print(posts)
            return cell
        }else{
            let cell = MovieListCell()
            cell.configurePost(posts)
            print(posts)

            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = DataService.instance.loadedPost[indexPath.row].movieImdbLink
        performSegue(withIdentifier: "ImdbSegue", sender: movie )
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ImdbSegue"{
            let destinationController = segue.destination as! ImbdVC
            if let sender = sender as? String{
                destinationController.urlStr = sender
            }
        }
    }
    
    func onPostLoaded(notify: AnyObject){
        movieTableView.reloadData()
    }
}
