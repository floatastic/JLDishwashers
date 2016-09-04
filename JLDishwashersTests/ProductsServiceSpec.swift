import Quick
import Nimble
@testable import JLDishwashers
import OHHTTPStubs

class ProductsServiceSpec: QuickSpec {
    override func spec() {
        describe("product service") {
            var service: ProductsService!
            var products: [SearchResultsProduct]?
            beforeEach {
                service = ProductsService()
            }
            
            context("receiving successful response with products") {
                beforeEach {
                    self.stubSuccessfulProductSearchRequest()
                    service.fetchList { products = $0 }
                }
                
                it("should return number of products with mapped values") {
                    expect(products).toEventually(haveCount(20))
                    
                    let lastProduct = products?[19]
                    
                    expect(lastProduct?.title) == "Miele G6860 SCVI Integrated Dishwasher, White"
                    expect(lastProduct?.price) == "1450.00"
                    expect(lastProduct?.imageURLString) == "//johnlewis.scene7.com/is/image/JohnLewis/235997205?"
                }
                
            }
        }
    }
    
    private func stubSuccessfulProductSearchRequest() {
        OHHTTPStubs.stubRequestsPassingTest({
            return $0.URLString == "https://api.johnlewis.com/v1/products/search?q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=20"
            }, withStubResponse: {_ in
                let filePath = NSBundle(forClass: self.dynamicType).pathForResource("ProductsSearchResponse", ofType: "json")!
                return OHHTTPStubsResponse(fileAtPath: filePath, statusCode: 200, headers: nil)
        })
    }
}
