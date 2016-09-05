import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let defaultReuseIdentifier = "ProductCollectionViewCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func updateValuesForProduct(product: SearchResultsProduct) {
        titleLabel.text = product.title
        priceLabel.text = product.price
    }
}
