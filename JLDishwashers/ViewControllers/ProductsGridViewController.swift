import UIKit

class ProductsGridViewController: UICollectionViewController {
    static let storyboardIdentifier = "ProductsGridViewController"
    
    let dataSource = ProductsGridDataSource.defaultDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("Dishwashers", comment: "")
        collectionView?.dataSource = dataSource
        
        dataSource.loadData { _ in
            self.collectionView?.reloadData()
        }
    }
}
