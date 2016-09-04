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
                    self.stubSearchRequestWithSuccessfulResponse()
                    service.fetchList {
                        switch $0 {
                        case .Right(let responseProducts):
                            products = responseProducts
                        default:
                            break
                        }
                    }
                }
                
                it("should return number of products with mapped values") {
                    expect(products).toEventually(haveCount(20))
                    
                    let lastProduct = products?[19]
                    
                    expect(lastProduct?.title) == "Miele G6860 SCVI Integrated Dishwasher, White"
                    expect(lastProduct?.price) == "1450.00"
                    expect(lastProduct?.imageURLString) == "//johnlewis.scene7.com/is/image/JohnLewis/235997205?"
                }
                
            }
            
            context("receiving successful response without products") {
                beforeEach {
                    self.stubSearchRequestWithEmptyResponse()
                    products = [SearchResultsProduct]()
                        
                    service.fetchList {
                        switch $0 {
                        case .Right(let responseProducts):
                            products = responseProducts
                        default:
                            break
                        }
                    }
                }
                
                it("should return nil") {
                    expect(products).toEventually(beNil())
                }
                
            }
        }
    }
}

private extension ProductsServiceSpec {
    func stubSearchRequestWithEmptyResponse() {
        let response = OHHTTPStubsResponse(JSONObject: [String : AnyObject](), statusCode: 200, headers: nil)
        stubProductSearchRequest(withResponse: response)
    }
    
    func stubSearchRequestWithSuccessfulResponse() {
        let filePath = NSBundle(forClass: self.dynamicType).pathForResource("ProductsSearchResponse", ofType: "json")!
        let response = OHHTTPStubsResponse(fileAtPath: filePath, statusCode: 200, headers: nil)
        stubProductSearchRequest(withResponse: response)
    }
    
    func stubProductSearchRequest(withResponse response: OHHTTPStubsResponse) {
        OHHTTPStubs.stubRequestsPassingTest({
            return $0.URLString == "https://api.johnlewis.com/v1/products/search?q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=20"
            }, withStubResponse: {_ in
                return response
        })
    }
}
