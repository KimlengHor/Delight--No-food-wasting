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
    @IBOutlet weak var closeButton: UIButton!
    
    //Variables
    var blurEffectView = UIVisualEffectView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
        setupNotificationObservers()
    }
    
    func setupView() {
        self.loginContainerView.isHidden = true
        self.signupContainerView.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
        
        let dismissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.mainView.addGestureRecognizer(dismissKeyboardTap)
    }
    
    @objc fileprivate func dismissKeyboard() {
        self.view.endEditing(true)
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
    
    func setupNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func handleKeyboardHide() {
        self.view.endEditing(true)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.transform = .identity
        })
    }
    
    @objc fileprivate func handleKeyboardShow(notification: Notification) {
        guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
            else { return }
        let keyboardFrame = value.cgRectValue
        let bottomSpace = view.frame.height - loginContainerView.frame.origin.y - loginContainerView.frame.height
        let difference = keyboardFrame.height - bottomSpace
        self.view.transform = CGAffineTransform(translationX: 0, y: -difference - 15)
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
        
        closeButton.isHidden = false
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
        
        closeButton.isHidden = false
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        blurEffectView.isHidden = true
        loginContainerView.isHidden = true
        signupContainerView.isHidden = true
        closeButton.isHidden = true
    }
}

