//
//  BottomBorderedTextField.swift
//  task
//
//  Created by Abhilash on 03/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class BottomBorderedTextField: UITextField
{

    let bottomBorder = UIView() //UIView as bottom Border
    
    override init(frame: CGRect)
    {
        super.init(frame:frame)
        
        self.initialSetup()
    }
    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
        
        self.initialSetup()
       
    }
    

    func initialSetup()
    {
        self.borderStyle = UITextField.BorderStyle.none
        self.bottomBorder.backgroundColor = Color.textFieldGray()
        self.addSubview(self.bottomBorder)
        
        
        //Constraints
        self.bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        self.bottomBorder.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.bottomBorder.heightAnchor.constraint(equalToConstant: 0.7).isActive = true
        self.bottomBorder.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        
    }
    
    
    

}



