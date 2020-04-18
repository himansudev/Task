
import Foundation


struct JsonStruct:Decodable
{

   let page : Int!
   let results : [structResult]!
   let totalPages : Int!
   let totalResults : Int!
}

struct structResult:Decodable
{
    let adult : Bool?
    let backdropPath : String?
    let genreIds : [Int]?
    let id : Int?
    let originalLanguage : String?
    let originalTitle : String?
    let overview : String?
    let popularity : Float?
    let poster_path : String?
    let release_date : String?
    let title : String?
    let video : Bool?
    let vote_average : Float?
    let voteCount : Int?
}
