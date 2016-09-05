import Argo
import Curry

struct SearchResultsProduct {
    
    let price: String?
    let title: String?
    let imageURLString: String?
    
    static func decodeFromJSONObject(jsonObject: AnyObject) -> SearchResultsProduct? {
        switch SearchResultsProduct.decode(JSON(jsonObject)) {
        case .Success(let item):
            return item
        default:
            return nil
        }
    }
    
    func secureImageURLString() -> String? {
        return imageURLString.map { "https:\($0)" }
    }
}

extension SearchResultsProduct: Decodable {
    static func decode(j: JSON) -> Decoded<SearchResultsProduct> {
        return curry(SearchResultsProduct.init)
            <^> j <|? ["price", "now"]
            <*> j <|? ["title"]
            <*> j <|? ["image"]
    }
}