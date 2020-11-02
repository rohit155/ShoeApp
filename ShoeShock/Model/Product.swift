//
//  Product.swift
//  ShoeShock
//
//  Created by Rohit Jangid on 18/10/20.
//

import Foundation

struct Product {
    private(set) public var title: String
    private(set) public var price: Double
    private(set) public var description: String
    private(set) public var imageName: [String]
    
    init(title: String, price: Double, description: String, imageName: [String]) {
        self.title = title
        self.price = price
        self.description = description
        self.imageName = imageName
    }
}
