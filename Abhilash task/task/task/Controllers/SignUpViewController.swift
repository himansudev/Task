//
//  SSignUpViewController.swift
//  task
//
//  Created by Abhilash on 04/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController
{

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.configureUI()
    }
    
    
   
    
    func configureUI()
    {
        self.configureImageSection()
        self.configureButtons()
        self.configureTextFields()
        self.configureSuperviews()
    }
    
    func configureSuperviews()
    {
        self.contentView.backgroundColor = UIColor.clear
        self.scrollView.backgroundColor = UIColor.clear
        self.view.layer.contents = Image.loginBackground().cgImage
        self.view.layer.contentsGravity = CALayerContentsGravity.resize
    }
    
    
    func configureImageSection()
    {
        let iv = self.imageView!
        iv.layer.cornerRadius = iv.frame.height / 2
        iv.image = Image.placeholderProfileImage()
        
        
        let lbl = self.signUpLabel!
        lbl.text = Strings.signUpLabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 19)
    }
    
    func configureTextFields()
    {
        let textFieldPlaceholder = [Strings.nameTFPlaceholder(),Strings.MobileTFPlaceholder(),Strings.EmailTFPlaceholder(),Strings.RoleTFPlaceholder(),Strings.FlatTFPlaceholder()]
        
        let font = UIFont.boldSystemFont(ofSize: 19)
        
        for (i,tf) in textFields.enumerated()
        {
            tf.text = textFieldPlaceholder[i]
            tf.font = font
            tf.delegate = self
        }
    }
    
    func configureButtons()
    {
        let sb = self.signUpButton!
        sb.layer.cornerRadius = sb.frame.height / 2
        sb.backgroundColor = Color.loginButtonColor()
        sb.setTitle(Strings.signUpButton(), for: UIControl.State.normal)
        sb.setTitleColor(UIColor.white, for: UIControl.State.normal)
        sb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        
        
        
        let lb = self.loginButton!
        lb.setTitle(Strings.LoginButtonText(), for: UIControl.State.normal)
        lb.titleLabel?.textAlignment = NSTextAlignment.center
        lb.titleLabel?.numberOfLines = 2
        lb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        lb.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        lb.addTarget(self, action: #selector(loginButtonEH), for: UIControl.Event.touchUpInside)
        
    }
    
    
    
    
    
    


}

//Event Handlers
extension SignUpViewController
{
    @objc func loginButtonEH()
    {
        self.dismiss(animated: true, completion: nil)
    }
}




//For Textfield Delegates
extension SignUpViewController:UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        
          let textFieldPlaceholder = [Strings.nameTFPlaceholder(),Strings.MobileTFPlaceholder(),Strings.EmailTFPlaceholder(),Strings.RoleTFPlaceholder(),Strings.FlatTFPlaceholder()]
        
        //Getting The Index Of The TextField In The Array
        let i = getTextField(textField: textField)
        
        if(textFields[i].text == "")
        {
            textField.text = textFieldPlaceholder[i]
        }

    }
    
    
    
    //Return The Index Of The TextField In The Array
    func getTextField(textField:UITextField) -> Int
    {
        for (i,tf) in textFields.enumerated()
        {
            if(tf == textField)
            {
                return i
                
               
            }
        }
        
        return 0
    }
}
