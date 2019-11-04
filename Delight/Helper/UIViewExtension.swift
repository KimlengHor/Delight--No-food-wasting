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
}
