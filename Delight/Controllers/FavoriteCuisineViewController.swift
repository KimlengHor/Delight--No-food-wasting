//
//  FavoriteCuisineViewController.swift
//  Delight
//
//  Created by hor kimleng on 10/24/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit

class FavoriteCuisineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //Variables
    var firstname = ""
    var lastname = ""
    var email = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 4
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCuisineCell", for: indexPath) as! FavoriteCuisineCell
        cell.setupView(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! FavoriteCuisineCell
        if cell.heatImageView.image(for: .normal) == #imageLiteral(resourceName: "Heart") {
            cell.heatImageView.setImage(#imageLiteral(resourceName: "redheart"), for: .normal)
        } else {
            cell.heatImageView.setImage(#imageLiteral(resourceName: "Heart"), for: .normal)
        }
    }
    
    //Actions
    @IBAction func saveButtonPressed(_ sender: Any) {
        //show to dietary restrictions view controller
        let dietaryVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DietaryVC") as! FoodDietaryViewController
        dietaryVC.email = email
        dietaryVC.password = password
        dietaryVC.firstname = firstname
        dietaryVC.lastname = lastname
        self.navigationController?.pushViewController(dietaryVC, animated: true)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
