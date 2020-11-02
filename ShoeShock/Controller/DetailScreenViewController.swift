//
//  DetailScreenViewController.swift
//  ShoeShock
//
//  Created by Rohit Jangid on 19/10/20.
//

import UIKit

class DetailScreenViewController: UIViewController {
    
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    private(set) public var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        
        guard let productInfo = product else { return }
        productTitle.text = productInfo.title
        productPrice.text = "Rs \(productInfo.price)"
        productDescription.text = productInfo.description
        pageView.currentPage = 0
    }
    
    func updateView(with selectedProduct: Product) {
        product = selectedProduct
    }
    
    @IBAction func checkoutTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "CheckoutVC", sender: product)
        guard let product = product else { return }
        
        if !DataService.instance.isProductInCart(product) {
            DataService.instance.addProduct(toCart: product, numberOfProduct: 1, status: true)
        } else {
            DataService.instance.updateQuantity(incart:nil,optionalItem: product, with: 1)
        }
    }

    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let barButton = UIBarButtonItem()
        barButton.title = ""
        navigationItem.backBarButtonItem = barButton
    }

}

//MARK: - UICollectionViewDelegate
extension DetailScreenViewController: UICollectionViewDelegate {}

//MARK: - UICollectionViewDataSource
extension DetailScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        guard let count = product?.imageName.count else {return 1}
        pageView.numberOfPages = count
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCell", for: indexPath) as? SliderCell {
            if let image = product?.imageName[indexPath.row] {
                cell.updateCell(with: image)
                pageView.currentPage = indexPath.row
                return cell
            }
        }
        return SliderCell()
    }
    
}
