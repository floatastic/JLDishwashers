import UIKit

class ProductDetailsViewController: UIViewController {
    func presentProduct(searchProduct: SearchResultsProduct) {
        title = searchProduct.title
    }
}
