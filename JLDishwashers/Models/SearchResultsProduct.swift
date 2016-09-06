import Argo
import Curry

struct SearchResultsProduct {
    
    let productId: String?
    let price: String?
    let title: String?
    let imageURLString: String?
    
    func secureImageURLString() -> String? {
        return imageURLString.map { "https:\($0)" }
    }
    
    func formattedPrice() -> String? {
        return price.map { return "£\($0)"}
    }
}

extension SearchResultsProduct: Decodable, StaticDecodable {
    typealias StaticDecodableType = SearchResultsProduct
    
    static func decode(j: JSON) -> Decoded<SearchResultsProduct> {
        return curry(SearchResultsProduct.init)
            <^> j <|? ["productId"]
            <*> j <|? ["price", "now"]
            <*> j <|? ["title"]
            <*> j <|? ["image"]
    }
}