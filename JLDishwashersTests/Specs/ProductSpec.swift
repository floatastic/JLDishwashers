import Quick
import Nimble
@testable import JLDishwashers

class ProductSpec: QuickSpec {
    override func spec() {
        describe("product") {
            var product: Product!
            
            context("created by mapping properties from JSON file") {
                beforeEach {
                    product = Product.decodeFromJSONObject(self.productJSON())
                }
                
                it("should have mapped properties") {
                    expect(product.title) == "Bosch SMS50C22GB Freestanding Dishwasher, White"
                    expect(product.imageURLStrings) == ["//johnlewis.scene7.com/is/image/JohnLewis/236477525?",
                                                        "//johnlewis.scene7.com/is/image/JohnLewis/236477525alt1?",
                                                        "//johnlewis.scene7.com/is/image/JohnLewis/236477525alt10?",
                                                        "//johnlewis.scene7.com/is/image/JohnLewis/236477525alt2?",
                                                        "//johnlewis.scene7.com/is/image/JohnLewis/236477525alt3?"]
                    expect(product.price) == "329.00"
                    expect(product.details) == "<p>Save on your energy bills with the A++...</p>"
                    expect(product.displaySpecialOffer) == ""
                    expect(product.includedServices) == ["2 year guarantee included"]
                    expect(product.code) == "81701222"
                }
            }
        }
    }
    
    private func productJSON() -> AnyObject {
        let filePath = NSBundle(forClass: self.dynamicType).pathForResource("ProductResponse", ofType: "json")!
        let fileContent = NSData(contentsOfFile: filePath)!
        return try! NSJSONSerialization.JSONObjectWithData(fileContent, options: [])
    }
}
