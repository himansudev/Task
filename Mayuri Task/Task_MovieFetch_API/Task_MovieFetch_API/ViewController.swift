
import UIKit

class ViewController: UIViewController,UISearchBarDelegate,UISearchControllerDelegate
{
    var movieDetails = [String:StorageModel]()
    
    var movieTitle = [String]()
    
    var filteredMovieTitle = [String]()
    
    var searchBarSearchText:String = ""
    
    @IBOutlet weak var sortButton: UIButton!
    
    static var ref:ViewController!
    
    static var collectionView:UICollectionView!
    
    //var filteredData = [String:StorageModel]()
    
    //var filteredImages = [String:UIImage]()
    
    var images = [String:UIImage]()
    
    var timer:Timer!
    
    var timerCount = 0
    
    var string = "Loading"
    
    @IBOutlet weak var progressLabel: UILabel!
    var apiCallCount = 1
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    
    let searchController = UISearchController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        self.sortButton.setTitle(Constant.sortByNone(), for: UIControl.State.normal)
        
        self.sortButton.addTarget(self, action: #selector(sortButtonEH), for: UIControl.Event.touchUpInside)
        
        self.configureSearchBar()
        
        ViewController.collectionView = self.movieCollectionView
        
        ViewController.ref = self
        
        self.configureCollectionView()
        
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerEH), userInfo: nil, repeats: true)
        
        Service.loginDetails(pageNo: 1)
      
    }
    
    
    func configureSearchBar()
    {
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        navigationItem.searchController = self.searchController
        
    }
    
    
    var apiCount = 1
    
    @IBAction func getMoreMoview(_ sender: Any)
    {
        
        apiCount += 1
        
        Service.loginDetails(pageNo: apiCount)
        
        
    }
    
    
    @IBAction func reloadData(_ sender: Any)
    {
        self.movieCollectionView.reloadData()
    }
    
    
    @IBAction func showAllData(_ sender: Any)
    {
        
//        for (i,movie) in filteredData.enumerated()
//        {
//            //print("\(i + 1))",movie.movieTitle, " : ",movie.imagePath)
//        }
    }
    
}




extension ViewController:UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController)
    {
        
//        if(self.images.count != apiCallCount * 20)
//        {
//            let alertController = UIAlertController(title: "Page No \(self.apiCallCount) Loading", message: "Please Wait Till Page No \(self.apiCallCount) Data Loads ", preferredStyle: UIAlertController.Style.alert)
//            
//            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (_) in
//                
//                searchController.searchBar.resignFirstResponder()
//                
//            })
//            
//            alertController.addAction(okAction)
//            
//            self.present(alertController, animated: true, completion: nil)
//            
//            
//            
//            
//            return
//        }
        
        
        guard let searchText = searchController.searchBar.text else {return}
        
        self.searchBarSearchText = searchText
        if(searchText == "")
        {
            print("#########")
            
            self.filteredMovieTitle = self.movieTitle
            
            self.movieCollectionView.reloadData()
        }
        else
        {
            
            print("&&&&&&&&")
            
            self.filteredMovieTitle = self.movieTitle.filter({ $0.contains(searchText) })
            
            self.movieCollectionView.reloadData()
            
        }
    }
    
    func getMovieTitleArray() -> [String]
    {
        var movieTitle = [String]()
        
        for value in self.movieDetails
        {
           // movieTitle.append(value.movieTitle)
        }
        
        return movieTitle
    }
    
    func getMovieReleaseDateArray()
    {
        
    }
    
    func getMovieOverviewArray()
    {
        
    }
    
    //func
    
    
    
}







extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
        //print("Number Of Rows : ",filteredData.count)
        
        return filteredMovieTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionViewCell
        
        let key = self.filteredMovieTitle[indexPath.row]
        
        cell.label.text = "\(indexPath.row))" + self.movieDetails[key]!.movieTitle
        
        
       
        
        if(images.count-1 >= indexPath.row)
        {
            cell.imageView.image = images[self.movieDetails[key]!.movieTitle]
            
            if(cell.imageView.subviews.count != 0)
            {
                for i in cell.imageView.subviews
                {
                    i.removeFromSuperview()
                }
            }
        }
        else
        {
            
                cell.imageView.image = nil
                let activityIndicatorView = UIActivityIndicatorView()
                let transfrom = CGAffineTransform.init(scaleX: 2.5, y: 2.5)
                activityIndicatorView.transform = transfrom
                activityIndicatorView.center = cell.imageView.center
                cell.imageView.addSubview(activityIndicatorView)
                activityIndicatorView.startAnimating()

        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        
        
        let key = self.filteredMovieTitle[indexPath.row]
        
        
        if(indexPath.row <= images.count - 1)
        {
            detailVC.thumbnailImage = images[self.movieDetails[key]!.movieTitle]
        }
        
        
        detailVC.releaseDate = self.movieDetails[key]!.movieTitle
        
        detailVC.rating = String(self.movieDetails[key]!.rating)
        
        detailVC.overview = self.movieDetails[key]!.overview
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {


        if(indexPath.row <= images.count-1)
        {
            print("Will Display : ", indexPath.row)

            print(indexPath.row,"  result : ",indexPath.row % 19 == 0 && indexPath.row != 19)



            if(indexPath.row % 19 == 0 && indexPath.row != 0 && apiCallCount < (indexPath.row / 19) + 1)
            {
                
                apiCallCount = (indexPath.row / 19) + 1
                print("Calling Page No : ",apiCallCount)
                      
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerEH), userInfo: nil, repeats: true)
                
                Service.loginDetails(pageNo: apiCallCount)
                
                
                
                
            }
        }


    
        

    }
    
    
    
    @objc func timerEH()
    {
        
        
        self.timerCount += 1
        
        if(self.timerCount < 13)
        {
           string += "."
        }
        else
        {
            string = "Loading"
            self.timerCount = 0
        }
        
        self.progressLabel.text = string
        
    }
    
    
    
    func configureCollectionView()
    {
        
        
        self.movieCollectionView.delegate = self
        
        
        self.movieCollectionView.dataSource = self
    }
}


extension ViewController:UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: self.movieCollectionView.frame.width / 2, height: self.movieCollectionView.frame.width / 2 + 100)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}

extension ViewController
{
    func getImage(from url:String) -> UIImage?
    {
        var image:UIImage?
        let imageUrlInStr = "https://image.tmdb.org/t/p/original\(url)"
        
        let imageUrl = URL(string: imageUrlInStr)
        if let imageData = try? Data(contentsOf: imageUrl!){
        image  = UIImage(data: imageData)!
        }
        
        return image
        
        
    }

}


extension ViewController
{
    @objc func sortButtonEH()
    {
        if(sortButton.titleLabel?.text == Constant.sortByNone())
        {
            let sortedDict = getPopularityDictInOrder()
            
            self.filteredMovieTitle = [String]()
            for value in sortedDict
            {
                
                
                self.filteredMovieTitle.append(value.key)
            }
            
            self.movieCollectionView.reloadData()
            
            sortButton.setTitle(Constant.sortByPopularity(), for: UIControl.State.normal)
        }
        else if(sortButton.titleLabel?.text == Constant.sortByPopularity())
        {
            sortButton.setTitle(Constant.sortByRating(), for: UIControl.State.normal)
        }
        else
        {
            sortButton.setTitle(Constant.sortByNone(), for: UIControl.State.normal)
        }
    }
    
    
//    func sortPopularityInDescendingOrder()
//    {
//        let popularityDict = getPopularityInKeyValuePairs()
//
//        var popularityKeyDict = [Int:String]()
//        var popularityValueDict = [Int:Float]()
//        var
//        var i = 0
//        for (k,v) in popularityDict
//        {
//            popularityKeyDict[i] = k
//
//            popularityValueDict[i] = v
//        }
//
//        let sortedPopularity =
//
//    }
//
    
    func getPopularityDictInOrder() -> [(key:String, value:Float)]
    {
        var popularityDict = [String:Float]()
        
        for (k,v) in self.movieDetails
        {
            popularityDict[k] = v.popularity
        }
        
        
        var sortedDict = popularityDict.sorted { $0.1 < $1.1 }
        sortedDict.reverse()
        
    
        
        
        
        return sortedDict
    }
}
