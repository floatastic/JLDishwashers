import Quick
import Nimble
@testable import JLDishwashers

class ProductDetailsViewControllerSpec: QuickSpec {
    override func spec() {
        describe("product details view controller") {
            var controller: ProductDetailsViewController!
            beforeEach {
                controller = ProductDetailsViewController()
            }
            
            context("presenting search product") {
                beforeEach {
                    controller.presentProduct(ProductsHelper.searchProduct())
                }
                
                it("should set title") {
                    expect(controller.title) == "A product"
                }
            }
        }
    }
}
