//
//  SignupViewController.swift
//  Delight
//
//  Created by hor kimleng on 10/24/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

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
    
//    //after create a new user, users document will add a new document
//    fileprivate func saveInfoToFirestore() {
//        let uid = Auth.auth().currentUser?.uid ?? ""
//        let docData: [String: Any] = [
//            "firstName": firstNameTextField.text ?? "",
//            "lastName": lastNameTextField.text ?? ""
//        ]
//        
//        Firestore.firestore().collection("users").document(uid).setData(docData) { (error) in
//            if let error = error {
//                print("Fail to add to the database ", error)
//                return
//            }
//        }
//    }
    
    fileprivate func signupUser() {
//        startSpinnerAnimation(view: self.view)
//        if let email = emailTextField.text, let password = passwordTextField.text {
//            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
//                if let error = error {
//                    print(error)
//                    showAlert(viewController: self, title: "Signup error", message: error.localizedDescription)
//                    spinner.removeFromSuperview()
//                    return
//                }
//
//                //show to favorite cusines view controller
//                spinner.removeFromSuperview()
                let favoriteCuisineVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FavoriteVC") as! FavoriteCuisineViewController
                favoriteCuisineVC.firstname = self.firstNameTextField.text ?? ""
                favoriteCuisineVC.lastname = self.lastNameTextField.text ?? ""
                favoriteCuisineVC.email = self.emailTextField.text ?? ""
                favoriteCuisineVC.password = self.passwordTextField.text ?? ""
                self.navigationController?.pushViewController(favoriteCuisineVC, animated: true)
                
                //self.saveInfoToFirestore()
            //}
        //}
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        signupUser()
    }
}
