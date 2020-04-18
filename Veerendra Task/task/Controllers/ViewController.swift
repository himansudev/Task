

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var tableview: UITableView!
    
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var loadingLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var activityIndicatorHeight: NSLayoutConstraint!
    
    static var mainVCRef:ViewController!
    
    var tableViewData:ResponseModel?
    
    var images = [UIImage]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        ViewController.mainVCRef = self
        
        self.configureTableView()
        
        startActivityIndicator(activityIndicator:activityIndicatorView)
        
        
        Service.shared.getData()
        
    }
    
    func startActivityIndicator(activityIndicator:UIActivityIndicatorView)
    {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
        //view.addSubview(activityIndicator)
               
        activityIndicator.startAnimating()
        
        
              
    }
    
    
    func stopActivityIndicator(activityIndicator: UIActivityIndicatorView)
    {
        loadingLabelHeight.constant = 0
        activityIndicatorHeight.constant = 0
        activityIndicatorView.stopAnimating()
        
    }
    
    
    func getImageFromUrl(imageUrlInString url:String) -> UIImage
    {
        
        
        var data:Data?
        do
        {
            data = try Data(contentsOf: URL(string: url)!)
        }
        catch
        {
            print(error.localizedDescription)
        }
        
        return UIImage(data: data!)!
    }
    
    func getMyImages()
    {
        
        
        DispatchQueue.main.async {
            for x in self.tableViewData!.articles
            {
                let url = x.image.src
                
                
                
                ViewController.mainVCRef.images.append(ViewController.mainVCRef.getImageFromUrl(imageUrlInString: url))
                    
                ViewController.mainVCRef.tableview.reloadData()
                
            }
        }
    }


}



extension ViewController:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let tableViewData = self.tableViewData
        {
            return (tableViewData.articles.count)
        }
        else
        {
            return 0
        }
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.imgView.backgroundColor = UIColor.green
        
        
        
        cell.titleLabel.text = self.tableViewData?.articles[indexPath.row].title
        
        let summary = self.tableViewData?.articles[indexPath.row].summary_html
        

        
        cell.summaryLabel.text = summary != "" ? summary  : "Not Available"
        
        
        
        
        
        if(self.images.count > indexPath.row)
        {
          cell.imgView.image = self.images[indexPath.row]
        }
        else
        {
            cell.imgView.image = nil
            let activityIndicator = UIActivityIndicatorView()
            cell.addSubview(activityIndicator)
            
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            activityIndicator.centerXAnchor.constraint(equalTo: cell.imgView.centerXAnchor, constant: 0).isActive = true
            activityIndicator.centerYAnchor.constraint(equalTo: cell.imgView.centerYAnchor, constant: 0).isActive = true
            
            
            self.startActivityIndicator(activityIndicator: activityIndicator)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let webViewVC = self.storyboard?.instantiateViewController(identifier: "WebViewController") as! WebViewController
        
        webViewVC.htmlCode = tableViewData?.articles[indexPath.row].body_html
        
        
        self.navigationController?.pushViewController(webViewVC, animated: true)
    }
    
    
    
    func configureTableView()
    {
        self.tableview.dataSource = self
        self.tableview.delegate = self
    }
}

