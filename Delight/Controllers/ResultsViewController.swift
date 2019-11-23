//
//  ResultsViewController.swift
//  Delight
//
//  Created by hor kimleng on 11/22/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ResultsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    //IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Variables
    var foods = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        Firestore.firestore().collection("foods").getDocuments { (snapshots, error) in
            if let error = error {
                print(error)
                return
            }
            
            for document in snapshots!.documents {
                let food = Food(dictionary: document.data())
                self.foods.append(food)
            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodResultCell", for: indexPath) as! ResultsCollectionViewCell
        cell.setupView(foods: foods, index: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 245)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        detailVC.food = self.foods[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
