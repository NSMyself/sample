//
//  Calendar+SameDay.swift
//  impresa
//
//  Created by João Pereira on 31/10/2017.
//  Copyright © 2017 nsmyself. All rights reserved.
//

import Foundation

extension Calendar {
    
    private func same(firstDate lhs: Date, secondDate rhs: Date, granularity: Calendar.Component) -> Bool {
        return (compare(lhs, to: rhs, toGranularity: granularity) == .orderedSame)
    }
    
    func sameDay(firstDate lhs: Date, secondDate rhs: Date) -> Bool {
        return same(firstDate: lhs, secondDate: rhs, granularity: .day)
    }
    
    func sameMonth(firstDate lhs: Date, secondDate rhs: Date) -> Bool {
        return same(firstDate: lhs, secondDate: rhs, granularity: .month)
    }
}

