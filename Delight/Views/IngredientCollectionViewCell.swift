//
//  IngredientCollectionViewCell.swift
//  Delight
//
//  Created by hor kimleng on 11/22/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit

class IngredientCollectionViewCell: UICollectionViewCell {
    
    //IBOutlets
    @IBOutlet weak var ingredientView: UIView!
    @IBOutlet weak var ingredientNameLabel: UILabel!
    
    override func awakeFromNib() {
        ingredientView.createRoundCorner(cornerRadius: 20)
    }
    
    func setupView(ingredients: [String], index: Int) {
        ingredientNameLabel.text = ingredients[index]
    }
}
