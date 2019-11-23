//
//  ResultsCollectionViewCell.swift
//  Delight
//
//  Created by hor kimleng on 11/22/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit

class ResultsCollectionViewCell: UICollectionViewCell {
    
    //IBOutlets
    @IBOutlet weak var foodView: UIView!
    @IBOutlet weak var foodNameLabel: UILabel!
    
    override func awakeFromNib() {
        foodView.createRoundCorner(cornerRadius: 15)
    }
    
    func setupView(foods: [Food], index: Int) {
        foodNameLabel.text = foods[index].title
    }
}
