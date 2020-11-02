//
//  RoundedButton.swift
//  ShoeShock
//
//  Created by Rohit Jangid on 19/10/20.
//

import UIKit

class RoundedButton: UIButton {

    override func draw(_ rect: CGRect) {
        layer.cornerRadius = 5
        clipsToBounds = true
    }

}
