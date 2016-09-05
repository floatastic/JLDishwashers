import UIKit

class ProductsGridViewController: UICollectionViewController {
    static let storyboardIdentifier = "ProductsGridViewController"
    
    let dataSource = ProductsGridDataSource.defaultDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("Dishwashers", comment: "")
        collectionView?.dataSource = dataSource
        
        dataSource.loadData { _ in
            self.updateTitle()
            self.collectionView?.reloadData()
        }
    }
    
    private func updateTitle() {
        let count = dataSource.products?.count ?? 0
        title = String(format: "%@ (%u)", NSLocalizedString("Dishwashers", comment: ""), count)
    }
}
