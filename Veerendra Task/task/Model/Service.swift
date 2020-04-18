

import Foundation


class Service
{
    
    static let shared = Service()
    
    var decodedData:[Articles]?
    
    let serviceUrl = "https://dev-api.vajro.com/fetch_shopify_article?appid=14382&blog_handle=news"
    
    func getData()
    {
        
        
        guard let url = URL(string: serviceUrl) else {return}
        
        URLSession.shared.dataTask(with: url, completionHandler: {
            
            (data,resp,err)
            
            in
            
            if let data = data
            {
                do
                {

                    
                    let decodedData = try JSONDecoder().decode(ResponseModel.self, from: data)
                    
                    ViewController.mainVCRef.tableViewData = decodedData
                    
                    
                    print("No Of Objects : ",decodedData.articles.count)
                    
                    
                    
                    
                    DispatchQueue.main.async
                    {
                        ViewController.mainVCRef.tableview.reloadData()
                        
                    }
                    
                    
                    
                    //var k = 0
                    
                    for x in decodedData.articles
                    {
                        let url = x.image.src
                        ViewController.mainVCRef.images.append(ViewController.mainVCRef.getImageFromUrl(imageUrlInString: url))
                        
                        
//                        print(k)
//                        print(ViewController.mainVCRef.images.count)
//                        k += 1
                        
                        
                        DispatchQueue.main.async
                        {
                            ViewController.mainVCRef.tableview.reloadData()
                        }
                        
                        
                    }
                    
                    DispatchQueue.main.async
                    {
                        ViewController.mainVCRef.stopActivityIndicator(activityIndicator: ViewController.mainVCRef.activityIndicatorView)
                    }
                
                   
                    
                    
                    
                    
                    
                    
                    
                    
                
                    
                    
                    
                    
                    
                    
//                    DispatchQueue.main.async
//                    {
//                        ViewController.mainVCRef.tableViewData = decodedData
//                        
//                        
//                        
//                        ViewController.mainVCRef.getMyImages()
//                        
//                        
//                        
//                        for x in decodedData.articles
//                        {
//                            let url = x.image.src
//                        ViewController.mainVCRef.images.append(ViewController.mainVCRef.getImageFromUrl(imageUrlInString: url))
//                            
//                            ViewController.mainVCRef.tableview.reloadData()
//                            
//                        }
//
//                        ViewController.mainVCRef.stopActivityIndicator()
//                        
//                    }
//                    
                
                    
                }
                catch
                {
                    print(error.localizedDescription)
                }
            }
            
            
            
            }).resume()
        
        
    }
}



struct ResponseModel:Decodable
{
    let articles:[Articles]
}

struct Articles:Decodable
{
    
    let summary_html:String
    
    let title:String
    
    let image:Image
    
    let body_html:String
}

struct Image:Decodable
{

    let src:String
}
