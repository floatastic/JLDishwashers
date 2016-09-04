import Quick
import Nimble
import Foundation
@testable import JLDishwashers

class SearchResultsProductSpec: QuickSpec {
    override func spec() {
        describe("search results product") {
            var product: SearchResultsProduct!
            
            context("created by mapping properties from JSON file") {
                beforeEach {
                    product = SearchResultsProduct.decodeFromJSONObject(self.singleProductJSON())
                }
                
                it("should have mapped properties") {
                    expect(product.price) == "329.00"
                    expect(product.title) == "Bosch SMS50C22GB Freestanding Dishwasher, White"
                    expect(product.imageURLString) == "//johnlewis.scene7.com/is/image/JohnLewis/236477525?"
                }
            }
        }
    }
    
    private func singleProductJSON() -> AnyObject {
        let filePath = NSBundle(forClass: self.dynamicType).pathForResource("ProductSearchFirst", ofType: "json")!
        let fileContent = NSData(contentsOfFile: filePath)!
        return try! NSJSONSerialization.JSONObjectWithData(fileContent, options: [])
    }
}
