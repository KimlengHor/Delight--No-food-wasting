//
//  CreateSpinner.swift
//  Delight
//
//  Created by hor kimleng on 10/29/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit

let spinner: UIActivityIndicatorView = {
    let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
    spinner.setupTheRoundedView(cornerRadius: 10, borderColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), borderWidth: 0)
    spinner.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    spinner.translatesAutoresizingMaskIntoConstraints = false
    spinner.hidesWhenStopped = true
    return spinner
}()

func startSpinnerAnimation(view: UIView) {
    view.addSubview(spinner)
    spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    spinner.startAnimating()
}
