//
//  IngredientViewController.swift
//  Delight
//
//  Created by hor kimleng on 11/22/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit
import FirebaseFirestore

class IngredientViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Variables
    var ingredients = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredients.count
    }
       
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IngredientCell", for: indexPath) as! IngredientCollectionViewCell
        cell.setupView(ingredients: ingredients, index: indexPath.item)
        return cell
   }
    
   @IBAction func findFoodButtonPressed(_ sender: Any) {
    
    startSpinnerAnimation(view: self.view)
        
    Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { (_) in
        spinner.removeFromSuperview()
        let resultVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ResultVC") as! ResultsViewController
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
   }
}
