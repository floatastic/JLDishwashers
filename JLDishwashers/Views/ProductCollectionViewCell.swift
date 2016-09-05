import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let defaultReuseIdentifier = "ProductCollectionViewCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.borderColor = Style.Colors.lightGray.CGColor
        layer.borderWidth = 1
    }
    
    func updateValuesForProduct(product: SearchResultsProduct) {
        titleLabel.text = product.title
        priceLabel.text = product.price
    }
}
