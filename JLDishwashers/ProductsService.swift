import Foundation
import Alamofire

class ProductsService {
    private typealias JSONDict = [String : AnyObject]
    
    private let productsKey = "products"
    
    private let searchURLString = "https://api.johnlewis.com/v1/products/search?q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=20"
    
    func fetchList(completion: [SearchResultsProduct]? -> Void) {
        Alamofire.request(.GET, searchURLString, parameters: nil).responseJSON { response in
            if let httpResponse = response.response where 200 ... 299 ~= httpResponse.statusCode {
                switch response.result {
                case .Success(let json as JSONDict):
                    completion(self.productsFromResponse(json[self.productsKey] as? [JSONDict]))
                default:
                    completion(nil)
                }
            }
        }
    }
    
    private func productsFromResponse(jsonArray: [JSONDict]?) -> [SearchResultsProduct]? {
        return jsonArray.map {
            $0.flatMap { SearchResultsProduct.decodeFromJSONObject($0) }
        }
    }
}
