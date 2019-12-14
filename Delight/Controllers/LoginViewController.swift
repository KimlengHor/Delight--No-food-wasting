//
//  LoginViewController.swift
//  Delight
//
//  Created by hor kimleng on 10/24/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class LoginViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    fileprivate func loginUser() {
        startSpinnerAnimation(view: self.view)
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    print(error)
                    showAlert(viewController: self, title: "Login error", message: error.localizedDescription)
                    spinner.removeFromSuperview()
                    return
                }
                
                //show to welcome view controller
                spinner.removeFromSuperview()
                let welcomeVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WelcomeVC") as! WelcomeViewController
                self.navigationController?.pushViewController(welcomeVC, animated: true)
                
                print("Success")
            }
                
        }
    }
    
    //Actions
    @IBAction func loginButtonPressed(_ sender: Any) {
//        if let path = Bundle.main.path(forResource: "test", ofType: "json") {
//            print("Yes")
//            do {
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
//                //print(jsonResult.first ?? "")
////                for result in jsonResult {
////                    print(result)
////                    Firestore.firestore().collection("foods").document().setData([result.key: result.value])
////                }
////                jsonResult.forEach { (key, value) in
////                    print("\(key): \(value)")
////                    Firestore.firestore().collection("foods").document().setData([key: value])
////                }
////                jsonResult.forEach { (result) in
////                    Firestore.firestore().collection("foods").document().setData(result)
////                }
//                //Firestore.firestore().collection("foods").document().setData(["yes": "love"])
//            } catch {
//               // handle error
//                print("Oh shit")
//            }
//        } else {
//            print("Oh nooo")
//        }
        
        loginUser()
    }
}
