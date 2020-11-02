//
//  Cart.swift
//  ShoeShock
//
//  Created by Rohit Jangid on 20/10/20.
//

import Foundation

struct SelectedProduct {
    private(set) public var selectedProduct: Product
    private(set) public var addToCart = false
    var quantity: Int
}
struct Cart {
    var products = [SelectedProduct]()
}
