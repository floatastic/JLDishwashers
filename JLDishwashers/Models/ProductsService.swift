import Foundation
import Alamofire

class ProductsService {
    typealias SearchResult = Either<NSError?, [SearchResultsProduct]?>
    typealias ProductDetailsResult = Either<NSError?, Product?>
    
    private typealias JSONDict = [String : AnyObject]
    
    private struct Endpoints {
        static let searchURLString = "https://api.johnlewis.com/v1/products/search?q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=20"
        static let productDetailsURLString = "https://api.johnlewis.com/v1/products/%@?key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb"
    }
    
    private let productsKey = "products"
    
    func fetchList(completion: SearchResult -> Void) {
        
        let jsonParseBlock: (JSONDict -> [SearchResultsProduct]?) = {
            let productsDict = $0[self.productsKey] as? [JSONDict]
            return self.productsFromResponse(productsDict)
        }
        
        makeJSONRequestWithURLString(Endpoints.searchURLString, jsonParseBlock: jsonParseBlock, completion: completion)
    }
    
    private func productsFromResponse(jsonArray: [JSONDict]?) -> [SearchResultsProduct]? {
        return jsonArray.map {
            $0.flatMap { SearchResultsProduct.decodeFromJSONObject($0) }
        }
    }
    
    func fetchProductDetails(product: SearchResultsProduct, completion: ProductDetailsResult -> Void) {
        guard let urlString = productDetailsURLString(product) else {
            completion(Either.Left(nil))
            return
        }
        
        let jsonParseBlock: (JSONDict -> Product?) = { return Product.decodeFromJSONObject($0) }
        
        makeJSONRequestWithURLString(urlString, jsonParseBlock: jsonParseBlock, completion: completion)
    }
    
    private func makeJSONRequestWithURLString<T>(urlString: String, jsonParseBlock: (JSONDict -> T?), completion: (Either<NSError?, T?> -> Void)) {
        
        Alamofire.request(.GET, urlString, parameters: nil).responseJSON { response in
            switch response.result {
            case .Success(let json as JSONDict):
                let result: Either<NSError?, T?> = Either.Right(jsonParseBlock(json))
                completion(result)
            case .Failure(let error):
                completion(Either.Left(error))
            default:
                completion(Either.Right(nil) as Either<NSError?, T?>)
            }
        }
    }
    
    private func productDetailsURLString(product: SearchResultsProduct) -> String? {
        guard let productId = product.productId else {
            return nil
        }
        
        return String(format: Endpoints.productDetailsURLString, productId)
    }
}
