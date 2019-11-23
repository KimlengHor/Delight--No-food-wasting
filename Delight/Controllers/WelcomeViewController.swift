//
//  WelcomeViewController.swift
//  Delight
//
//  Created by hor kimleng on 10/24/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class WelcomeViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var startScanningView: UIView!
    @IBOutlet weak var welcomeView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        startScanningView.addGestureRecognizer(tap)
        
        createLinearGradient(gradientView: startScanningView, firstColor: #colorLiteral(red: 0.9529411765, green: 0.3176470588, blue: 0.4392156863, alpha: 1), secondColor: #colorLiteral(red: 0.03921568627, green: 0.1215686275, blue: 0.1882352941, alpha: 1), radius: self.startScanningView.frame.height / 2)
        
        Firestore.firestore().collection("users").document(Auth.auth().currentUser?.uid ?? "").getDocument { (snapshot, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let data = snapshot?.data() {
                let firstname = data["firstName"]
                let lastname = data["lastName"]
                DispatchQueue.main.async {
                    self.usernameLabel.text = "\(firstname ?? "") \(lastname ?? "")".capitalized
                }
            }
        }
    }
    
    @objc fileprivate func handleTap() {
        let scanningVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ScanningVC") as! ScanningViewController
        self.navigationController?.pushViewController(scanningVC, animated: true)
    }
}
