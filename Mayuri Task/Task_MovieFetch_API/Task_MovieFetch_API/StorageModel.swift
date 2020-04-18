

import Foundation
struct StorageModel
{
    let movieTitle:String
    let imagePath:String
    let releaseDate:String
    let rating:Float
    let overview:String
    let popularity:Float
    
    init(movieTitle:String,imagePath:String,releaseDate:String,rating:Float,overview:String,popularity:Float)
    {
        self.movieTitle = movieTitle
        self.imagePath = imagePath
        self.releaseDate = releaseDate
        self.rating = rating
        self.overview = overview
        self.popularity = popularity
    }
}
