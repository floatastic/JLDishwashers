import Foundation
import Alamofire

class ProductsService {
    typealias SearchResult = Either<NSError?, [SearchResultsProduct]?>
    
    private typealias JSONDict = [String : AnyObject]
    
    private let productsKey = "products"
    
    private let searchURLString = "https://api.johnlewis.com/v1/products/search?q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=20"
    
    func fetchList(completion: SearchResult -> Void) {
        Alamofire.request(.GET, searchURLString, parameters: nil).responseJSON { response in
            switch response.result {
            case .Success(let json as JSONDict):
                let productsDict = json[self.productsKey] as? [JSONDict]
                let result: SearchResult = Either.Right(self.productsFromResponse(productsDict))
                completion(result)
            case .Failure(let error):
                completion(Either.Left(error))
            default:
                completion(Either.Right(nil) as SearchResult)
            }
        }
    }
    
    private func productsFromResponse(jsonArray: [JSONDict]?) -> [SearchResultsProduct]? {
        return jsonArray.map {
            $0.flatMap { SearchResultsProduct.decodeFromJSONObject($0) }
        }
    }
}
