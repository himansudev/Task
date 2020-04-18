//
//  JsonSerialize.swift
//  Task_MovieFetch_API
//
//  Created by Mayurii Gajbhiye on 14/03/20.
//

import UIKit

class Service:NSObject{


        
        
    static func loginDetails(pageNo:Int) //b->[String:Any]
    {

        var URLReqObj:URLRequest!
        var dataTaskObj:URLSessionDataTask!
    
 
        URLReqObj = URLRequest(url:URL(string:"https://api.themoviedb.org/3/discover/movie?api_key=d25cd69656139deec874178800941f48&region=IN&language=en-IN&releasedate.gte=2017-08-01&page=\(String(pageNo))&append_to_response=credits")!)

        
        
        
    URLReqObj.httpMethod = "GET"

    dataTaskObj = URLSession.shared.dataTask(with: URLReqObj, completionHandler: {( data, connDetails , err) in

           
      
        do{

      
            
           
            let movieData = try JSONDecoder().decode(JsonStruct.self, from: data!)
            
            
           var movies = [StorageModel]()
            
            for value in movieData.results
            {
                
                let movie = StorageModel(movieTitle: value.title!, imagePath: value.poster_path!,releaseDate: value.release_date!, rating: value.vote_average!,overview: value.overview!,popularity: value.popularity!)
                
                
                
                movies.append(movie)
                ViewController.ref.movieDetails[movie.movieTitle] = movie
                //ViewController.ref.filteredData[movie.movieTitle] = movie
                
                ViewController.ref.movieTitle.append(movie.movieTitle)
                ViewController.ref.filteredMovieTitle.append(movie.movieTitle)
                
                
                
            }
            
         
            
            
            DispatchQueue.main.async
            {
                ViewController.collectionView.reloadData()
            }
            
            
            for (i,x) in movies.enumerated()
            {
              let img = ViewController.ref.getImage(from: x.imagePath)
            
                print(i,") Getting images")
                
                
                ViewController.ref.images[x.movieTitle] = img!
               
                
                DispatchQueue.main.async
                {
                    
                    
                    
                    
                    if(ViewController.ref.filteredMovieTitle.count != 0)
                    {
                        print("IndexPath : ",ViewController.ref.filteredMovieTitle.count - 1)
                        //ViewController.collectionView.reloadItems(at: [IndexPath(row: ViewController.ref.filteredMovieTitle.count - 1, section: 0)])
                       if let currentRow = ViewController.ref.filteredMovieTitle.firstIndex(of: x.movieTitle)
                       {
                            ViewController.collectionView.reloadItems(at: [IndexPath(row: currentRow, section: 0)])
                        }
                        
                            
                        
                    }
                    
                    
                    
                                    
                    
                    
                }
            }
            
            if ViewController.ref.timer != nil
            {
                ViewController.ref.timer.invalidate()
                
                DispatchQueue.main.async
                {
                    ViewController.ref.progressLabel.text = ""
                }
                
                
            }
            
            
            

               }

               catch{

                   print("Something went wrong")

               }

           })

           dataTaskObj.resume()
             
        
                           
              


             }
      
        
        
    }


//https://image.tmdb.org/t/p/original
