//
//  DetailViewController.swift
//  Delight
//
//  Created by hor kimleng on 11/22/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //IBOutlets
    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    
    //Variables
    var food: Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = food?.instructions
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if let food = food {
            foodTitleLabel.text = food.title
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food?.ingredients.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell") as! IngredientTableViewCell
        cell.setupView(ingredients: food?.ingredients as! [String], index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
