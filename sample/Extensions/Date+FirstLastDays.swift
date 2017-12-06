//
//  Date+FirstLastDays.swift
//  sample
//
//  Created by João Pereira on 06/12/2017.
//  Copyright © 2017 nsmyself. All rights reserved.
//

import Foundation

extension Date {
    var firstDayOfTheMonth: Date? {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self))
    }
    
    var lastDayOfMonth: Date? {
        
        let calendar = Calendar.current
        
        guard let range = calendar.range(of: .day, in: .month, for: self) else {
            return nil
        }
        
        var components = calendar.dateComponents([.year, .month, .day], from: self)
        components.day = range.upperBound - 1
        return calendar.date(from: components)
    }
}
