//
//  ComplaintSubmissionViewController.swift
//  task
//
//  Created by Abhilash on 04/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class ComplaintSubmissionViewController: UIViewController
{

    //MARK:- UIObjects
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var okLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var feedbackButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.configureUI()
        
      
    }
    
    func configureUI()
    {
        self.configureSuperView()
        self.configureSuperView()
        self.configureNavigationBar()
        self.configureCardView()
        self.configureImageView()
        self.configureFeedbackButton()
            
    }
    
    func configureNavigationBar()
    {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func configureSuperView()
    {
        let vl = self.view.layer
        vl.contents = Image.loginBackground().cgImage
        vl.contentsGravity = CALayerContentsGravity.resize
    }
    
    
    func configureCardView()
    {
        let cv = self.cardView!
        cv.backgroundColor = UIColor.white
        cv.layer.shadowOpacity = 12
        cv.layer.shadowColor = UIColor.black.cgColor
        cv.layer.shadowOffset = CGSize(width: 8, height: 8)
        cv.layer.borderWidth = 1
        
        
        let hl = self.headerLabel
        hl?.text = Strings.Sucessfully()
        hl?.textAlignment = NSTextAlignment.center
        hl?.font = UIFont.boldSystemFont(ofSize: 25)
        
        
        let ml = self.messageLabel!
        ml.text = Strings.messageLabel()
        ml.textAlignment = NSTextAlignment.center
        ml.numberOfLines = 4
        ml.textColor = UIColor.lightGray
        ml.font = UIFont.boldSystemFont(ofSize: 17)
        
        
        self.okLabel.text = Strings.ok()
        
    }
    
    func configureImageView()
    {
        let iv = self.imageView!
        iv.image = Image.tick()
        iv.layer.cornerRadius = iv.frame.height / 2
    }
    
    func configureFeedbackButton()
    {
        let fb = self.feedbackButton!
        fb.backgroundColor = Color.loginButtonColor()
        fb.setTitle("Feedback", for: UIControl.State.normal)
        fb.setTitleColor(UIColor.white, for: UIControl.State.normal)
        fb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        fb.layer.cornerRadius = fb.frame.height / 2
        fb.addTarget(self, action: #selector(feedbackButtonEH), for: UIControl.Event.touchUpInside)
    }
   

}



//Event Handler
extension ComplaintSubmissionViewController
{
    @objc func feedbackButtonEH()
    {
        let feedbackVC = self.storyboard?.instantiateViewController(identifier: Strings.feedbackVC())
        
        self.navigationController?.pushViewController(feedbackVC!, animated: true)
    }
}
