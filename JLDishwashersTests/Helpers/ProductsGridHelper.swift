import UIKit
@testable import JLDishwashers

class ProductsGridHelper {
    class func defaultCell() -> ProductCollectionViewCell {
        let titleLabel = UILabel()
        let priceLabel = UILabel()
        
        let cell = ProductCollectionViewCell()
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