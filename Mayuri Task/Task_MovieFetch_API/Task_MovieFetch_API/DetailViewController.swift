//
//  DetailViewController.swift
//  Task_MovieFetch_API
//
//  Created by Himansu Sekhar Panigrahi on 16/03/20.
//

import UIKit

class DetailViewController: UIViewController
{

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var ratingFieldLabel: UILabel!
    
    @IBOutlet weak var releaseDateFeildLabel: UILabel!
    
    @IBOutlet weak var releaseDateInfoLabel: UILabel!
    @IBOutlet weak var overviewFieldlabel: UILabel!
    @IBOutlet weak var ratingInfoLabel: UILabel!
    
    @IBOutlet weak var overviewInfoLabel: UILabel!
    
    
    var overview:String?
    var thumbnailImage:UIImage?
    var rating:String?
    var releaseDate:String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.initialSetup()
        self.assignAllValues()
        
    }
    
    
    
    func initialSetup()
    {
        self.ratingFieldLabel.text = "Rating :"
        self.releaseDateFeildLabel.text = "Release Date :"
        self.overviewFieldlabel.text = "Overview :"
    }
    
    func assignAllValues()
    {
        self.thumbnailImageView.image = self.thumbnailImage
        self.releaseDateInfoLabel.text = self.releaseDate
        self.ratingInfoLabel.text = self.rating
        self.overviewInfoLabel.text = self.overview
    }
    

    

}
