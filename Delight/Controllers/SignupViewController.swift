//
//  SignupViewController.swift
//  Delight
//
//  Created by hor kimleng on 10/24/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    fileprivate func signupUser() {
        startSpinnerAnimation(view: self.view)
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    print(error)
                    return
                }
                
                //show to favorite cusines view controller
                spinner.removeFromSuperview()
                let favoriteCuisineVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FavoriteVC") as! FavoriteCuisineViewController
                self.navigationController?.pushViewController(favoriteCuisineVC, animated: true)
            }
        }
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        signupUser()
    }
}
