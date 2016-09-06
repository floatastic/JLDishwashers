import UIKit

class ProductsGridDataSource: NSObject, UICollectionViewDataSource {
    
    typealias LoadCompletion = ProductsService.SearchResult -> ()
    
    let service: ProductsService
    
    var products: [SearchResultsProduct]?
    
    init(service: ProductsService) {
        self.service = service
    }
    
    class func defaultDataSource() -> ProductsGridDataSource {
        return ProductsGridDataSource(service: ProductsService())
    }
    
    func loadData(completion: LoadCompletion) {
        service.fetchList { result in
            switch result {
            case .Right(let products):
                self.products = products
            default:
                self.products = nil
            }
            
            completion(result)
        }
    }
    
    func productForIndexPath(indexPath: NSIndexPath) -> SearchResultsProduct? {
        return products?[indexPath.row]
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ProductCollectionViewCell.defaultReuseIdentifier, forIndexPath: indexPath) as! ProductCollectionViewCell
        cell.updateValuesForProduct(products![indexPath.row])
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
}