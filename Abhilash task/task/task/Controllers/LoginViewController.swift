//
//  LoginViewController.swift
//  task
//
//  Created by Abhilash on 02/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{

    //MARK:- UIObjects
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    
    @IBOutlet weak var separatorSuperView: UIView!
    @IBOutlet weak var separatorLabel: UILabel!
    
    @IBOutlet weak var separatorLine: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.configureUI()

       
    }
    

}



//MARK:- Configuring UIObjects
extension LoginViewController
{
    
    func configureUI()
    {
        //Main UI Objects
        self.contentView.backgroundColor = UIColor.clear
        self.scrollView.backgroundColor = UIColor.clear
        self.view.layer.contents = Image.loginBackground().cgImage
        self.view.layer.contentsGravity = CALayerContentsGravity.resize
        self.logoImageView.image = Image.logoImage()
        
        
        //All UI Related Functions
        self.configureTextFields()
        self.configureLoginbutton()
        self.configureForgotPasswordButton()
        self.configureSeparatorUI()
        self.configureFacebookAndGoogleButton()
    }
    
    
    func configureTextFields()
    {
        
        let textFields = [nameTextField,passwordTextField]
        
        for tf in textFields
        {
            tf?.borderStyle = UITextField.BorderStyle.none
            tf?.font = UIFont.boldSystemFont(ofSize: 20)
            tf?.borderStyle = UITextField.BorderStyle.none
            tf?.delegate = self
            
        }
        
        
        self.nameTextField.text = Strings.name()
        self.passwordTextField.text = Strings.password()
    }
    
    
    func configureLoginbutton()
    {
        self.loginButton.setTitle(Strings.login(), for: UIControl.State.normal)
        self.loginButton.backgroundColor = Color.loginButtonColor()
        self.loginButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        self.loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.loginButton.layer.cornerRadius = self.loginButton.frame.height / 2
        self.loginButton.addTarget(self, action: #selector(loginButtonEH), for: UIControl.Event.touchUpInside)
        
    }
    
    func configureForgotPasswordButton()
    {
        self.forgotPasswordButton.setTitle(Strings.forgotPasswordButtonTitle(), for: UIControl.State.normal)
    self.forgotPasswordButton.setTitleColor(Color.forgotPasswordButtonTitleColor(), for: UIControl.State.normal)
        self.forgotPasswordButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonEH), for: UIControl.Event.touchUpInside)
    }
    
    func configureSeparatorUI()
    {
        self.separatorSuperView.backgroundColor = UIColor.clear
        self.separatorLine.backgroundColor = Color.separatorLineColor()
        self.separatorLabel.backgroundColor = UIColor.white
        self.separatorLabel.text = Strings.or()
        self.separatorLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func configureFacebookAndGoogleButton()
    {
        self.facebookButton.setTitle("", for: UIControl.State.normal)
        self.googleButton.setTitle("", for: UIControl.State.normal)
        self.facebookButton.setBackgroundImage(Image.facebookButton(), for: UIControl.State.normal)
        self.googleButton.setBackgroundImage(Image.googleButton(), for: UIControl.State.normal)
    }
    
   
    
    
}




//MARK:- Textfield Delegates
extension LoginViewController:UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        if(nameTextField.text == "")
        {
            nameTextField.text = Strings.name()
        }
        else 
        {
           passwordTextField.text = Strings.password()
        }
    }
}









//MARK:- Event Handlers
extension LoginViewController
{
    @objc func loginButtonEH()
    {        
        let serviceVC = self.storyboard?.instantiateViewController(identifier: "TabBarController")
    
        serviceVC?.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        self.present(serviceVC!, animated: true, completion: nil)
    }
    
    
    
    @objc func forgotPasswordButtonEH()
    {
        let signUpVC = self.storyboard?.instantiateViewController(identifier: Strings.signUpVC()) as! SignUpViewController
        
        signUpVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(signUpVC, animated: true)
    }
}
