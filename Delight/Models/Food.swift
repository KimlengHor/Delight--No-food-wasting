//
//  Food.swift
//  Delight
//
//  Created by hor kimleng on 11/22/19.
//  Copyright © 2019 kimlenghor. All rights reserved.
//

import Foundation

struct Food {
    let title: String
    //let picture_link: String
    let instructions: String
    let ingredients: [Any]
    
    init(dictionary: [String: Any]) {
        self.title = dictionary["title"] as! String
        //self.picture_link = dictionary["picture_link"] as! String
        self.instructions = dictionary["instructions"] as! String
        self.ingredients = dictionary["ingredients"] as! [Any]
    }
}
