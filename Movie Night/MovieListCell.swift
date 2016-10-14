//
//  MovieListCell.swift
//  Movie Night
//
//  Created by Fathureza Januarza on 8/2/16.
//  Copyright © 2016 tedihouse. All rights reserved.
//

import UIKit

class MovieListCell: UITableViewCell {
    @IBOutlet weak var movieImageImg: UIImageView!
    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var movieStudioLbl: UILabel!
    @IBOutlet weak var imdbViewBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configurePost(post: Movie){
        movieTitleLbl.text = post.movieTitle
        movieStudioLbl.text = post.movieStudio
        movieImageImg.image = DataService.instance.imageForPath(path: post.movieImagePath)
        print(post.movieTitle, post.movieStudio)
    }
}
