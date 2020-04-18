//
//  ViewController.swift
//  tableViewIssue
//
//  Created by Himansu Sekhar Panigrahi on 04/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var dropDown:DropDown!
    
    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       dropDown = DropDown(superView: self.myView)
    }
    
    
    @IBAction func buttonEH(_ sender: Any)
    {
        
        dropDown.setupOnButtonClick()
    }
    

}

