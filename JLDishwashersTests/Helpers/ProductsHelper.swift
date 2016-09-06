@testable import JLDishwashers

class ProductsHelper {
    class func searchProduct() -> SearchResultsProduct {
        return SearchResultsProduct(productId: "234", price: "123.00", title: "A product", imageURLString: nil)
    }
}