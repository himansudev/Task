//
//  ProfileImageTableViewCell.swift
//  deleteItLater
//
//  Created by Abhilash on 03/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class ProfileImageTableViewCell: UITableViewCell
{
    //Labels
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    
    //Images
    @IBOutlet weak var profileImageViewLabel: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        
    }
    

}
