//
//  ServicesViewController.swift
//  task
//
//  Created by Abhilash on 03/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController
{

    //MARK:- UIObjects
    
  
    @IBOutlet weak var imageView:UIImageView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet var serviceMenuSuperview: [UIView]!
    
    @IBOutlet weak var serviceMenuMainSuperview: UIView!
    
    @IBOutlet var serviceMenuImageView:[UIImageView]!
    
    @IBOutlet var serviceMenuLabel: [UILabel]!
    
    var isSliderViewActive:Bool = false
    {
        willSet(newValue)
        {
            if(newValue == true)
            {
                self.slideOutSliderMenu()
            }
            else
            {
                self.slideInSliderMenu()
            }
        }
    }
    
    
    
    //Slider TableView Data
    let sliderMenuName = ["User Profile","Notification","Setting","Contact Us","About Us","Logout"]
    
    let sliderMenuImages = [Image.sliderMenuUserProfile(),
                  Image.sliderMenuNotification(),
                  Image.sliderMenuSettings(),
                  Image.sliderMenuContactUs(),
                  Image.sliderMenuAboutUs(),
                  Image.sliderMenuLogout()]
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.configureNavigationBar()
        self.configureServiceMenu()
        self.configureImageView()
        self.configurePageControl()
        self.configureHeaderLabel()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        self.configureTabBar()
        self.configureNavigationBar()
    }
    
    func configureNavigationBar()
    {
        //Bar Button Items
        
        let leftBarButton = UIBarButtonItem(image: Image.leftBarButton().withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(leftBarButtonEH))
        
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        let rightBarButtonItem1 = UIBarButtonItem(image: Image.rightBarButton1().withRenderingMode(.alwaysOriginal), style: .plain, target: nil,action: nil)
        
        let rightBarButtonItem2 = UIBarButtonItem(image: Image.ellipsis().withRenderingMode(.alwaysOriginal), style: .plain, target: nil, action: nil)
        
        self.navigationItem.rightBarButtonItems = [rightBarButtonItem2,rightBarButtonItem1]
            

        
        let labelTitle = UILabel()
        labelTitle.backgroundColor = UIColor.red
        labelTitle.textColor = UIColor.black
        labelTitle.numberOfLines = 0
        labelTitle.textAlignment = .left
        labelTitle.text = Strings.societyApp()
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.textColor = UIColor.white
        
        
        //Constraints
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.widthAnchor.constraint(equalToConstant: view.frame.width * 0.5).isActive = true
        self.navigationItem.titleView = labelTitle
        
        
        //Navigation Bar
        
        self.navigationController?.navigationBar.isHidden = false
        
        
        self.navigationController?.navigationBar.barTintColor = Color.theme()
    }
    
    func configureServiceMenu()
    {
        
        
        self.serviceMenuMainSuperview.layer.borderWidth = 1
        self.serviceMenuMainSuperview.layer.borderColor = UIColor.white.cgColor
        
        let labelText = [Strings.ElectricService(),Strings.PlumbingService(),Strings.CarpenterService(),Strings.PaintingService(),Strings.RentalService(),Strings.VendorService(),Strings.MiscellaneousService(),Strings.ELeaseService()]
        
        let images = [Image.electricService(),Image.plumbingservice(),Image.carpenterService(),Image.paintingService(),Image.rentalService(),Image.vendorService(),Image.miscelleanousService(),Image.eLeaseService()]
        
        
        //Configuring All Objects At A Time Using Loops
        for (i,label) in self.serviceMenuLabel.enumerated()
        {

            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureEH))
            self.serviceMenuSuperview[i].backgroundColor = UIColor.white
            self.serviceMenuSuperview[i].layer.borderWidth = 0.5
            self.serviceMenuSuperview[i].layer.borderColor = Color.separatorLineColor().cgColor
            self.serviceMenuSuperview[i].addGestureRecognizer(tapGesture)
            
            self.serviceMenuImageView[i].image = images[i]
            
            
            label.text = labelText[i]
            label.font = UIFont.boldSystemFont(ofSize: 12)
            
        }
        
        
       
        
    }
    
    func configureImageView()
    {
        self.imageView.image = Image.serviceDisplayImage()
    }
    
    
    func configurePageControl()
    {
        self.pageControl.backgroundColor = Color.theme()
    }
    
    
    func configureHeaderLabel()
    {
        self.headerLabel.text = Strings.service()
        self.headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func configureTabBar()
    {
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.tabBar.backgroundColor = Color.theme()
        self.tabBarController?.tabBar.tintColor = UIColor.white
        
    }
    
    
    
  
    
    
  
   
    

}


//Event handlers
extension ServicesViewController
{
    @objc func leftBarButtonEH()
    {
        
        self.isSliderViewActive = !self.isSliderViewActive
        
    }
    
    
    func slideOutSliderMenu()
    {
        let activePos = CGPoint(x: 0, y: 0)
        let tableView = configureSliderTableView()
        UIView.animate(withDuration: 0.3, animations:
        {
            tableView.frame = CGRect(origin:activePos, size: CGSize(width: self.view.frame.width * 0.7, height: self.view.frame.height))
        })
       
        
        
        
        
    }
    
    func configureSliderTableView() -> UITableView
    {
        
        let inactivePos = CGPoint(x: -1 * self.view.frame.width * 0.7, y: 0)
        let frame = CGRect(origin:inactivePos, size: CGSize(width: self.view.frame.width * 0.7, height: self.view.frame.height))
        
        let tableView = UITableView()
        tableView.frame = frame
        tableView.backgroundColor = UIColor.red
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
        
        
        let nib = UINib(nibName: "ProfileImageTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ProfileImageTableViewCell")
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }
    
    func slideInSliderMenu()
    {
         let inactivePos = CGPoint(x: -1 * self.view.frame.width * 0.7, y: 0)
        let subViews = self.view.subviews
        
        
        //Finding The TableView Object To Remove
        for subView in subViews
        {
            if let subView = subView as? UITableView
            {
                
                UIView.animate(withDuration: 0.3, animations:
                {
                    
                    subView.frame = CGRect(origin: inactivePos, size: CGSize(width: self.view.frame.width * 0.7, height: self.view.frame.height))
                    
                })
                
                Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(timerEH), userInfo: nil, repeats: false)
                
                
               
            }
        }
    }
    
    
    @objc func timerEH()
    {
        let subViews = self.view.subviews
        
        for subView in subViews
        {
            if let subView = subView as? UITableView
            {
                
               
                
                subView.removeFromSuperview()
                
                
               
            }
        }
    }
    
    //Tap Gesture EH
    @objc func tapGestureEH()
    {
        let complaintFormVC = self.storyboard?.instantiateViewController(identifier: "ComplaintFormViewController") as! ComplaintFormViewController
        
        self.tabBarController?.tabBar.isHidden = true
        
        self.navigationController?.pushViewController(complaintFormVC, animated: true)
    }
    
    
    
}



//Slider Menu Table View
extension ServicesViewController:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.sliderMenuName.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        //Profile Image Cell
        if(indexPath.row == 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: Strings.profileImageTVC(), for: indexPath) as! ProfileImageTableViewCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.backgroundColor = Color.theme()
            cell.profileImageViewLabel.backgroundColor = UIColor.black
            cell.profileImageViewLabel.layer.cornerRadius = cell.profileImageViewLabel.frame.height / 2
            cell.nameLabel.text = "Abhilash"
            cell.addressLabel.text = "B Block 308"
            cell.userIdLabel.text = "MAZ3325"
            return cell
        }
        //Normal Cell
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.backgroundColor = Color.sliderMenuCellColor()
            cell.textLabel?.text = self.sliderMenuName[indexPath.row - 1]
            cell.textLabel?.textAlignment = NSTextAlignment.right
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
            cell.imageView?.image = self.sliderMenuImages[indexPath.row - 1]
            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if(indexPath.row != 0)
        {
            return 100
        }
        else
        {
            return -1
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        if(indexPath.row == 6)
        {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
