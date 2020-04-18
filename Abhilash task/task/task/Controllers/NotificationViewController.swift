//
//  NotificationViewController.swift
//  task
//
//  Created by Abhilash on 04/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController
{

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.configureTableView()
        self.configureUI()
    }
    
    func configureUI()
    {
        self.navigationController?.navigationBar.barTintColor = Color.theme()
        self.navigationItem.title = "Status"
    }
    
    

}


//MARK:- Table View
extension NotificationViewController:UITableViewDelegate,UITableViewDataSource
{
    
    func configureTableView()
    {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        let nib = UINib(nibName: Strings.notificationTVC(), bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: Strings.notificationTVC())
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: Strings.notificationTVC(), for: indexPath) as! NotificationTVCell
        cell.nameLabel.text = "Kiran"
        cell.dateLabel.text = "12/12/2020"
        cell.addressLabel.text = "XYZ Apartment\nC - Block, Flat No - 201"
        cell.statusLabel.text = "Open"
        cell.imgView.image = Image.placeholderProfileImage()
        cell.problemLabel.text = "Tap Repair"
        cell.timeLabel.text = "12:10 AM"
       
        
        return cell
    }
    
}
