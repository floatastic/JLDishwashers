import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let defaultReuseIdentifier = "ProductCollectionViewCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addBorder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        addBorder()
    }
    
    private func addBorder() {
        layer.borderColor = Style.Colors.lightGray.CGColor
        layer.borderWidth = 1
    }
    
    func updateValuesForProduct(product: SearchResultsProduct) {
        titleLabel.text = product.title
        priceLabel.text = product.formattedPrice()
        loadImageFromURLString(product.secureImageURLString())
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
        priceLabel.text = nil
        imageView.image = nil
    }
    
    func loadImageFromURLString(urlString: String?) {
        guard let urlString = urlString, url = NSURL(string: urlString) else {
            return
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), {
            if let data = NSData(contentsOfURL: url),
                image = UIImage(data: data) {

                dispatch_async(dispatch_get_main_queue(), {
                    self.imageView.image = image
                })
            }
        })
    }
}
