//
//  UIViewExtension.swift
//  Delight
//
//  Created by hor kimleng on 10/29/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit

extension UIView {
    func setupTheRoundedView(cornerRadius: CGFloat, borderColor: CGColor, borderWidth: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
    }
    
    func createRoundCorner(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
    }
    
    func createSpecificRoundCorner(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

//create gradient
var gradientLayer: CAGradientLayer!

func createLinearGradient(gradientView: UIView, firstColor: UIColor, secondColor: UIColor, radius: CGFloat) {
    gradientLayer = CAGradientLayer()
    gradientLayer.frame = gradientView.bounds
    gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
    gradientView.createRoundCorner(cornerRadius: radius)
    gradientView.clipsToBounds = true
    gradientView.layer.insertSublayer(gradientLayer, at: 0)
}

