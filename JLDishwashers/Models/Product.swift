import Argo
import Curry

struct Product {
    
    let title: String?
    let imageURLStrings: [String]?
    let price: String?
    let details: String?
    let displaySpecialOffer: String?
    let includedServices: [String]?
    let code: String?
    
}

extension Product: Decodable, StaticDecodable {
    typealias StaticDecodableType = Product
    
    static func decode(j: JSON) -> Decoded<Product> {
        return curry(Product.init)
            <^> j <|? ["title"]
            <*> j <||? ["media", "images", "urls"]
            <*> j <|? ["price", "now"]
            <*> j <|? ["details", "productInformation"]
            <*> j <|? ["displaySpecialOffer"]
            <*> j <||? ["additionalServices", "includedServices"]
            <*> j <|? ["code"]
    }
}
