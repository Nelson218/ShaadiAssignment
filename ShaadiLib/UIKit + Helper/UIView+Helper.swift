//
//  UIView+Helper.swift
//  ShaadiLib
//
//  Created by Nelson Thomas Pereira on 20/11/20.
//

import UIKit

extension UIView {
    public func setRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    public func setBorder(width: CGFloat) {
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = width
        layer.masksToBounds = true
    }
}
