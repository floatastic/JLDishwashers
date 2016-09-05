import UIKit
@testable import JLDishwashers

class ProductsGridHelper {
    class func defaultCell() -> ProductCollectionViewCellStub {
        let titleLabel = UILabel()
        let priceLabel = UILabel()
        
        let cell = ProductCollectionViewCellStub()
        cell.priceLabel = titleLabel
        cell.titleLabel = priceLabel
        cell.contentView.addSubview(titleLabel)
        cell.contentView.addSubview(priceLabel)
        return cell
    }
    
    class func collectionView() -> UICollectionViewStub {
        return UICollectionViewStub(frame: CGRectZero, collectionViewLayout: UICollectionViewLayout())
    }
}

class UICollectionViewStub: UICollectionView {
    override func dequeueReusableCellWithReuseIdentifier(identifier: String, forIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return ProductsGridHelper.defaultCell()
    }
}

class ProductCollectionViewCellStub: ProductCollectionViewCell {
    override func loadImageFromURLString(urlString: String?) {
        
    }
}