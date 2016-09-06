import Quick
import Nimble
@testable import JLDishwashers

class ProductCollectionViewCellSpec: QuickSpec {
    override func spec() {
        describe("product collection view cell") {
            var cell: ProductCollectionViewCell!
            beforeEach {
                cell = ProductsGridHelper.defaultCell()
            }
            
            context("with values updated from a product") {
                beforeEach {
                    cell.updateValuesForProduct(self.testProduct())
                }
                
                it("should set expected values from a product model") {
                    expect(cell.titleLabel.text) == "A product"
                    expect(cell.priceLabel.text) == "£123.00"
                }
            }
        }
    }
    
    private func testProduct() -> SearchResultsProduct {
        return SearchResultsProduct(productId: "234", price: "123.00", title: "A product", imageURLString: nil)
    }
}
