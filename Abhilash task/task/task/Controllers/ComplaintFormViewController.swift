//
//  ComplaintFormViewController.swift
//  task
//
//  Created by Abhilash on 04/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class ComplaintFormViewController: UIViewController
{
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var problemLabel: UILabel!
    @IBOutlet weak var problemTextField: UITextField!
    @IBOutlet weak var slotdateTextField: UITextField!
    @IBOutlet weak var slotTimeTextField: UITextField!
    @IBOutlet weak var problemPhotoLabel: UILabel!
    @IBOutlet weak var problemPhotoImageView: UIImageView!
    @IBOutlet weak var problemPhotosSuperView: UIView!
    @IBOutlet weak var problemPhotoIButton: UIButton!
    @IBOutlet weak var slotDateLabel: UILabel!
    @IBOutlet weak var slotTimeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var problemPhotoTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var descriptionSuperView: UIView!
    @IBOutlet weak var descriptionButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.configureUI()
        self.configureTextFieldRightView()
        self.configureProblemPhotoSection()
       
    }
    
    override func viewDidLayoutSubviews()
    {
        self.configureDescriptionSection()
    }
    
    
    func configureUI()
    {
        self.contentView.backgroundColor = Color.sliderMenuCellColor()
        let textfields = [ self.problemTextField,self.problemPhotoTextField,self.slotdateTextField,self.slotTimeTextField,self.descriptionTextField]
        
        let placeholders = [
            Strings.problemTFPlaceHolder(),Strings.problemPhotoTFPlaceholder(),
               Strings.slotDateTFPlaceholder()
              ,Strings.slotTimeTFPlaceholder()
               ,Strings.Description()]
        
        let labels = [self.problemLabel,self.problemPhotoLabel,self.slotDateLabel,self.slotTimeLabel,self.descriptionLabel]
        
        let labelText = [Strings.Problem(),Strings.ClickProblemPhoto(),Strings.SlotDate(),Strings.SlotTime(),Strings.Description()]
        
        for (i,label) in labels.enumerated()
        {
            label?.text = labelText[i]
            textfields[i]?.placeholder = placeholders[i]
            
        }
        
        
        
    }
    
    func configureTextFieldRightView()
    {
        let textFields = [self.problemTextField,self.problemPhotoTextField,self.slotdateTextField,self.slotTimeTextField]
        
        let images = [Image.dropDown(),Image.camera(),Image.calendar(),Image.clock()]
        
        for (tf,image) in zip(textFields,images)
        {
            let button = UIButton()
           
            button.setBackgroundImage(image, for: UIControl.State.normal)
            button.backgroundColor = UIColor.green
            button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            tf?.rightView = button
            tf?.rightViewMode = UITextField.ViewMode.always
        }
        
       
    }
    
    func configureProblemPhotoSection()
    {
        
        self.problemPhotoImageView.image = Image.camera1()
        self.problemPhotoIButton.setTitle("", for: UIControl.State.normal)
        self.problemPhotoIButton.setBackgroundImage(Image.add(), for: UIControl.State.normal)
    }
    
    func configureDescriptionSection()
    {
        let button = self.descriptionButton!
        button.layer.cornerRadius = button.frame.height/2
        button.setTitle(Strings.submit(), for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.backgroundColor = Color.loginButtonColor()
        button.addTarget(self, action: #selector(descriptionButtonEH), for: UIControl.Event.touchUpInside)
        
        descriptionTextField.borderStyle = UITextField.BorderStyle.none
        
        
    }
    
    
    
    
    
    

}


//Event Handlers
extension ComplaintFormViewController
{
    @objc func descriptionButtonEH()
    {
        let complaintSubmissionVC = self.storyboard?.instantiateViewController(identifier: Strings.complaintSubmissionVC()) as! ComplaintSubmissionViewController
        
        
        complaintSubmissionVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
       
        
        self.navigationController?.pushViewController(complaintSubmissionVC, animated: true)
        
    }
}



