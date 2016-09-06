import Argo

protocol StaticDecodable {
    associatedtype StaticDecodableType: Decodable
    
    static func decodeFromJSONObject(jsonObject: AnyObject) -> StaticDecodableType.DecodedType?
}

extension StaticDecodable {
    static func decodeFromJSONObject(jsonObject: AnyObject) -> StaticDecodableType.DecodedType? {
        switch StaticDecodableType.decode(JSON(jsonObject)) {
        case .Success(let item):
            return item
        default:
            return nil
        }
    }
}