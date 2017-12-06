//
//  ViewControllerViewModel.swift
//  sample
//
//  Created by João Pereira on 06/12/2017.
//  Copyright © 2017 nsmyself. All rights reserved.
//

import Foundation

class ViewControllerViewModel {

    // MARK: - Calendar
    private var calendarDateFormatter: DateFormatter = {
        $0.dateFormat = "MMMM yyyy"
        return $0
    }(DateFormatter())
    
    var currentCalendarMonth: Date = Date()
    var selectedDate: Date = Date()
    
    func previousMonth() {
        if let date = Calendar.current.date(byAdding: .month, value: -1, to: currentCalendarMonth) {
            currentCalendarMonth = date
        }
    }
    
    func nextMonth() {
        if let date = Calendar.current.date(byAdding: .month, value: 1, to: currentCalendarMonth) {
            currentCalendarMonth = date
        }
    }
    
    var formattedCalendarDate: String {
        return calendarDateFormatter.string(from: currentCalendarMonth)
    }
}
