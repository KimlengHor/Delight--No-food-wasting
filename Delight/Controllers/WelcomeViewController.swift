//
//  WelcomeViewController.swift
//  Delight
//
//  Created by hor kimleng on 10/24/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var startScanningView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        startScanningView.addGestureRecognizer(tap)
    }
    
    @objc fileprivate func handleTap() {
        let scanningVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ScanningVC") as! ScanningViewController
        self.navigationController?.pushViewController(scanningVC, animated: true)
    }
}
