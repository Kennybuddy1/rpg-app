//
//  DevilWizard.swift
//  rpg-oop
//
//  Created by Kabir arora on 6/29/16.
//  Copyright © 2016 Kabir Arora. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String]{
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}
