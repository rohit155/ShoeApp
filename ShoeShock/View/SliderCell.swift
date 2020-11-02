//
//  SliderCell.swift
//  ShoeShock
//
//  Created by Rohit Jangid on 19/10/20.
//

import UIKit

class SliderCell: UICollectionViewCell {
    
    @IBOutlet weak var productImages: UIImageView!
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    func updateCell(with image: String) {
        productImages.image = UIImage(named: image)
    }
    
}
