//
//  Design.swift
//  sample
//
//  Created by João Pereira on 06/12/2017.
//  Copyright © 2017 nsmyself. All rights reserved.
//

import UIKit

struct Design {
    struct Calendar {
        
        struct Menu {
            static let background = UIColor.clear
        }
        
        static let dayOfWeek = UIColor.darkGray
        static let disabled = UIColor.lightGray
        
        struct Days {
            static let selected = UIColor.white
            static let regular = UIColor.darkGray
            static let futureOrPrevious = UIColor(red: 0.75, green: 0.77, blue: 0.8, alpha: 1)
        }
    }
}
