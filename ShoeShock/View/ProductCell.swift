//
//  ProductCell.swift
//  ShoeShock
//
//  Created by Rohit Jangid on 18/10/20.
//

import UIKit

protocol updateCartCountDelegate {
    func updateCart(with count: Int)
}

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView! {
        didSet {
            productImage.layer.cornerRadius = 5
            productImage.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var addToCart: UIButton!
    
    var product: Product?
    var addedToCart: Bool = false
    
    var delegate: updateCartCountDelegate?
    
    
    func updateCell(with product: Product) {
        self.product = product
        productTitle.text = product.title
        productPrice.text = "Rs \(product.price)"
        productImage.image = UIImage(named: product.imageName[0])
        addToCart.setImage(UIImage(systemName: DataService.instance.isAddedToCart(product)), for: .normal)
        delegate?.updateCart(with: DataService.instance.getQuantityCount())
    }
    
    override func draw(_ rect: CGRect) {
        layer.borderWidth = 2
        layer.borderColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }
    
    @IBAction func addToCartTapped(_ sender: UIButton) {
        addedToCart.toggle()
        guard let selectedProduct = product else { return }
        
        if !DataService.instance.isProductInCart(selectedProduct) {
            DataService.instance.addProduct(toCart: selectedProduct, numberOfProduct: 1, status: true)
            addToCart.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            DataService.instance.removeProduct(fromCart: selectedProduct, selectedProduct: nil)
            addToCart.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
        delegate?.updateCart(with: DataService.instance.getQuantityCount())
    }
}
