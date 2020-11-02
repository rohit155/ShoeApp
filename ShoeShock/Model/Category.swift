//
//  Category.swift
//  ShoeShock
//
//  Created by Rohit Jangid on 18/10/20.
//

import Foundation

struct Caterogy {
    private(set) public var title: String
    private(set) public var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
