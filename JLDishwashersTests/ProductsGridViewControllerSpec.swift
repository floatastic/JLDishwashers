import Quick
import Nimble
@testable import JLDishwashers

class ProductsGridViewControllerSpec: QuickSpec {
    override func spec() {
        describe("products grid view controller") {
            var controller: ProductsGridViewController!
            beforeEach {
                let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                controller = storyboard.instantiateViewControllerWithIdentifier(ProductsGridViewController.storyboardIdentifier) as? ProductsGridViewController
            }
            
            it("should connect a data source with collection view") {
                expect(controller.collectionView?.dataSource).toNot(beNil())
                expect(controller.collectionView?.dataSource) === controller.dataSource
            }
        }
    }
}
