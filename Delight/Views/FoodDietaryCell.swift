//
//  FoodDietaryCell.swift
//  Delight
//
//  Created by hor kimleng on 10/24/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit

class FoodDietaryCell: UITableViewCell {

    //IBOutlets
    @IBOutlet weak var foodDietaryTitleLabel: UILabel!
    
    //Variables
    let foodDietaries = ["Lactose Intolerance", "Peanut Allergies", "Gluten Free", "Diabetic"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(index: Int) {
        foodDietaryTitleLabel.text = foodDietaries[index]
    }

}
