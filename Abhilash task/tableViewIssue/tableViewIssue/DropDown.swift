//
//  DropDown.swift
//  tableViewIssue
//
//  Created by Himansu Sekhar Panigrahi on 04/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class DropDown: NSObject
{
    
    let tableView = UITableView()
    var superView:UIView!
    
    override init()
    {
        super.init()
        
    }
    
    convenience init(superView:UIView)
    {
        
        self.init()
        self.superView = superView
        
    }
    
    func setupOnButtonClick()
    {
        self.configureTableView()
    }
    


}

extension DropDown:UITableViewDataSource,UITableViewDelegate
{
    
    
    func configureTableView()
    {
        let tv = self.tableView
        tv.frame = CGRect(x: 100, y: 100, width: 100, height: 300)
        self.superView.addSubview(tv)
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tv.delegate = self
        tv.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = "Info"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
