//
//  FeedbackViewController.swift
//  task
//
//  Created by Abhilash on 04/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController
{

    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var yesLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var yessButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    
    var isYesButtonOn:Bool = true
    {
        
        willSet(newValue)
        {
            if(newValue)
            {
                self.yessButton.backgroundColor = UIColor.green
                self.yesLabel.textColor = UIColor.green
                self.noButton.backgroundColor = UIColor.white
                self.noLabel.textColor = UIColor.black
                
            }
            else
            {
                self.yessButton.backgroundColor = UIColor.white
                self.yesLabel.textColor = UIColor.black
                self.noButton.backgroundColor = UIColor.green
                self.noLabel.textColor = UIColor.green
            }
        }
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.configureUI()

        
    }
    
    func configureUI()
    {
        self.configureButtonsAndLabels()
        self.configureCardView()
    }
    
    
    func configureCardView()
    {
        let cv = self.cardView!
        cv.layer.cornerRadius = 12
        cv.layer.shadowOffset = CGSize(width: 5, height: 5)
        cv.layer.shadowOpacity = 10
        
        self.view.layer.contents = Image.loginBackground().cgImage
        self.view.layer.contentsGravity = CALayerContentsGravity.resize
        
    }
    
    
    func configureButtonsAndLabels()
    {
        self.yesLabel.text = "Yes"
        self.yesLabel.textColor = UIColor.green
        self.noLabel.text = "No"
        self.messageLabel.text = "Did You Like The App"
        self.messageLabel.font = UIFont.boldSystemFont(ofSize: 19)
        self.yesLabel.font = UIFont.boldSystemFont(ofSize: 22)
        self.noLabel.font = UIFont.boldSystemFont(ofSize: 22)
        
        
        
        self.converIntoRadioButton(button: self.yessButton)
        self.converIntoRadioButton(button: self.noButton)
        
        
        self.yessButton.backgroundColor = UIColor.green
        self.yessButton.addTarget(self, action: #selector(buttonEH(button:)), for: UIControl.Event.touchUpInside)
        self.noButton.addTarget(self, action: #selector(buttonEH(button:)), for: UIControl.Event.touchUpInside)
        
        
        
        let sb = self.submitButton!
        sb.setTitle("Submit", for: UIControl.State.normal)
        sb.addTarget(self, action: #selector(submitButtonEH), for: UIControl.Event.touchUpInside)
        sb.backgroundColor = UIColor.clear
        sb.setTitleColor(UIColor.black, for: UIControl.State.normal)
        
        
        
        let cb = self.cancelButton!
        cb.addTarget(self, action: #selector(cancelButtonEH), for: UIControl.Event.touchUpInside)
        cb.setTitle("Cancel", for: UIControl.State.normal)
        cb.backgroundColor = UIColor.clear
        cb.setTitleColor(UIColor.black, for: UIControl.State.normal)
    }
    
    func converIntoRadioButton(button:UIButton)
    {
        button.setTitle("", for: UIControl.State.normal)
        button.layer.cornerRadius = button.frame.height / 2
        button.backgroundColor = UIColor.white
        button.layer.borderWidth = 1.5
    }
    
    
    @objc func buttonEH(button:UIButton)
    {
        if(button == self.yessButton)
        {
            if(!self.isYesButtonOn)
            {
                self.isYesButtonOn = !self.isYesButtonOn
            }
            
        }
        else
        {
            if(self.isYesButtonOn)
            {
                self.isYesButtonOn = !self.isYesButtonOn
                
            }
            
        }
    }
    
    
    
    @objc func submitButtonEH()
    {
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    
    @objc func cancelButtonEH()
    {
       
        self.navigationController?.popToRootViewController(animated: true)
    }
    

   

}
