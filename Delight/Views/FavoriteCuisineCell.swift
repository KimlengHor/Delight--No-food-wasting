//
//  FavoriteCuisineCell.swift
//  Delight
//
//  Created by hor kimleng on 10/24/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import UIKit

class FavoriteCuisineCell: UITableViewCell {

    //IBOutlets
    @IBOutlet weak var cuisineTypeTitle: UILabel!
    @IBOutlet weak var heatImageView: UIButton!
    
    //Variables
    let cuisineTypes = ["Italian cuisine", "Mexican cuisine", "Thai cuisine", "American cuisine"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(index: Int) {
        cuisineTypeTitle.text = cuisineTypes[index]
    }

}
