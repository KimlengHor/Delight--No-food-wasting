//
//  ViewController.swift
//  Delight
//
//  Created by hor kimleng on 9/11/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var loginContainerView: UIView!
    @IBOutlet weak var signupContainerView: UIView!
    @IBOutlet var mainView: UIView!
    
    //Variables
    var blurEffectView = UIVisualEffectView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    func setupView() {
        self.loginContainerView.isHidden = true
        self.signupContainerView.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
        
        let dismissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.mainView.addGestureRecognizer(dismissKeyboardTap)
        
        let dismissPopupTap = UITapGestureRecognizer(target: self, action: #selector(dismissPopupView))
        //self.mainView.addGestureRecognizer(dismissPopupTap)
    }
    
    @objc fileprivate func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @objc fileprivate func dismissPopupView() {
        self.loginContainerView.isHidden = true
        self.signupContainerView.isHidden = true
    }
    
    fileprivate func createBlurView() {
        //create blur view
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        //add the blur effect to the view
        view.insertSubview(blurEffectView, at: 3)
    }
    
    //Actions
    @IBAction func loginButtonPressed(_ sender: Any) {
        self.loginContainerView.isHidden = false
        createBlurView()
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: {
            self.loginContainerView.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2)
        }) { (_) in
            UIView.animate(withDuration: 0.1, animations: {
                self.loginContainerView.transform = CGAffineTransform.identity
            })
        }
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        self.signupContainerView.isHidden = false
        createBlurView()
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: {
            self.signupContainerView.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2)
        }) { (_) in
            UIView.animate(withDuration: 0.1, animations: {
                self.signupContainerView.transform = CGAffineTransform.identity
            })
        }
    }
    
}

