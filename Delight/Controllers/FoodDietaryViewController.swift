//
//  FoodDietaryViewController.swift
//  Delight
//
//  Created by hor kimleng on 10/24/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class FoodDietaryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //Variables
    var email = ""
    var password = ""
    var firstname = ""
    var lastname = ""
    var favoriteCuisine = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //table view section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodDietaryCell", for: indexPath) as! FoodDietaryCell
        cell.setupView(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    //after create a new user, users document will add a new document
    fileprivate func saveInfoToFirestore() {
        let uid = Auth.auth().currentUser?.uid ?? ""
        let docData: [String: Any] = [
            "firstName": firstname,
            "lastName": lastname
        ]
        
        Firestore.firestore().collection("users").document(uid).setData(docData) { (error) in
            if let error = error {
                print("Fail to add to the database ", error)
                return
            }
            //show to welcome view controller
            let welcomeVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WelcomeVC") as! WelcomeViewController
            self.navigationController?.pushViewController(welcomeVC, animated: true)
        }
    }
    
    //Actions
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        startSpinnerAnimation(view: self.view)
        //if let email = emailTextField.text, let password = passwordTextField.text {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error)
                showAlert(viewController: self, title: "Signup error", message: error.localizedDescription)
                spinner.removeFromSuperview()
                return
            }
            
            spinner.removeFromSuperview()
            self.saveInfoToFirestore()
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
