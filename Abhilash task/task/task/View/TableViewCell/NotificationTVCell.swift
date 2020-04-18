//
//  NotificationTVCell.swift
//  task
//
//  Created by Abhilash on 04/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class NotificationTVCell: UITableViewCell {

    //View
    @IBOutlet weak var view: UIView!
    
    //Image View
    @IBOutlet weak var imgView: UIImageView!
    
    //Labels
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var problemLabel: UILabel!
   
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.initialSetup()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

       
    }
    
    
    func initialSetup()
    {
        self.configureLabels()
        self.configureImageSection()
        self.configureView()
    }
    
    func configureView()
    {
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.backgroundColor = Color.sliderMenuCellColor()
        self.view.backgroundColor = UIColor.white
    }
    
    
    func configureImageSection()
    {
        let iv = self.imgView!
        iv.layer.cornerRadius = 20
        iv.clipsToBounds = true
        
        let pl = self.problemLabel
        pl?.font = UIFont.boldSystemFont(ofSize: 10)
    }
    
    func configureLabels()
    {
        let dateAndAddressFont:CGFloat = 12
        let nameAndProgressFont:CGFloat = 15
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: nameAndProgressFont)
        self.statusLabel.font = UIFont.boldSystemFont(ofSize: nameAndProgressFont)
        self.addressLabel.font = UIFont.systemFont(ofSize: dateAndAddressFont)
        self.dateLabel.font = UIFont.systemFont(ofSize: dateAndAddressFont)
        self.timeLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        
        self.addressLabel.textColor = UIColor.lightGray
        self.dateLabel.textColor = UIColor.lightGray
        self.timeLabel.textColor = UIColor.lightGray
        
        
        self.addressLabel.numberOfLines = 3
        
    }
}
