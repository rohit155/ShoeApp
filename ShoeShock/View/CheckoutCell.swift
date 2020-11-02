//
//  CheckoutCell.swift
//  ShoeShock
//
//  Created by Rohit Jangid on 23/10/20.
//

import UIKit

protocol UpdateTotalQuantity {
    func updateQuantity(with item: Int)
    func updateTotalAmount(of items: Double)
    func emptyCart(item: SelectedProduct)
}

class CheckoutCell: UITableViewCell {
    
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQuantity: UILabel!
    @IBOutlet weak var productImage: UIImageView! {
        didSet {
            productImage.layer.cornerRadius = 5
            productImage.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var quantityStepper: UIStepper!
    var product: SelectedProduct?
    var delegate: UpdateTotalQuantity?
    
    func updateCell(with product: SelectedProduct) {
        self.product = product
        productTitle.text = product.selectedProduct.title
        productPrice.text = "Rs \(product.selectedProduct.price)"
        productImage.image = UIImage(named: product.selectedProduct.imageName[0])
        quantityStepper.setDecrementImage(quantityStepper.decrementImage(for: .normal), for: .normal)
        quantityStepper.setIncrementImage(quantityStepper.incrementImage(for: .normal), for: .normal)
        quantityStepper.backgroundColor = .lightGray
        quantityStepper.layer.cornerRadius = 5
        quantityStepper.value = Double(product.quantity)
        productQuantity.text = "x\(Int(quantityStepper.value))"
//        delegate?.updateTotalAmount(of: DataService.instance.getTotalAmount())
//        clipsToBounds = true
    }

    @IBAction func quantityStepperTapped(_ sender: UIStepper) {
        guard let selectedProduct = product else { return }
        if sender.value == 0 {
            DataService.instance.removeProduct(fromCart: nil, selectedProduct: selectedProduct)
            delegate?.emptyCart(item: selectedProduct)
        } else {
            productQuantity.text = "x\(Int(sender.value))"
            DataService.instance.updateQuantity(incart: selectedProduct, with: Int(sender.value))
//            delegate?.updateQuantity(with: DataService.instance.getQuantityCount())
//            delegate?.updateTotalAmount(of: DataService.instance.getTotalAmount())
        }
        delegate?.updateQuantity(with: DataService.instance.getQuantityCount())
        delegate?.updateTotalAmount(of: DataService.instance.getTotalAmount())
//        print(sender.value)
    }
}
