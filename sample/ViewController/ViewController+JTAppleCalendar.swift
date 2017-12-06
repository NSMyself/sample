//
//  ViewController+JTAppleCalendar.swift
//  sample
//
//  Created by João Pereira on 06/12/2017.
//  Copyright © 2017 nsmyself. All rights reserved.
//

import Foundation
import JTAppleCalendar

extension ViewController: JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate {
    
    private func colorOf(selectedDate selected: Date, currentDay current: Date) -> UIColor {
        
        if (Calendar.current.sameDay(firstDate: selected, secondDate: viewModel.selectedDate)) {
            return Design.Calendar.Days.selected
        } else if (Calendar.current.sameMonth(firstDate: selected, secondDate: viewModel.selectedDate)) {
            return Design.Calendar.Days.regular
        } else {
            return Design.Calendar.Days.futureOrPrevious
        }
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        
        guard let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: CalendarCellView.name, for: indexPath) as? CalendarCellView else { return JTAppleCell() }
        
        prettify(cell, using: date, state: cellState)
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        guard let cell = cell as? CalendarCellView else {
            return
        }
        
        prettify(cell, using: date, state: cellState)
    }
    
    private func prettify(_ cell: CalendarCellView, using date: Date, state cellState: CellState) {
        cell.dayLabel.text = cellState.text
        cell.dayLabel.textColor = colorOf(selectedDate: date, currentDay: viewModel.selectedDate)
        
        // Checking if we need to show the same day indicator
        let sameDay = (Calendar.current.compare(date, to: viewModel.selectedDate, toGranularity: .day) == .orderedSame)
        cell.selectedView.isHidden = !sameDay
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        guard let startDate = viewModel.currentCalendarMonth.firstDayOfTheMonth, let endDate = viewModel.currentCalendarMonth.lastDayOfMonth else {
            fatalError("Could not generate configuration parameters for the calendar")
        }
        
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: 6,
                                                 calendar: Calendar.current,
                                                 generateInDates: .forAllMonths,
                                                 generateOutDates: .off,
                                                 firstDayOfWeek: .monday)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        let oldDate = viewModel.selectedDate
        calendar.deselectDates(from: oldDate)
        viewModel.selectedDate = date
        
        if !(Calendar.current.sameMonth(firstDate: date, secondDate: oldDate)) {
            calendar.reloadData()
        }
        
        guard let cell = cell as? CalendarCellView else { return }
        cell.dayLabel.textColor = Design.Calendar.Days.selected
        cell.selectedView.isHidden = false
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let cell = cell as? CalendarCellView else { return }
        
        let color = (Calendar.current.sameMonth(firstDate: date, secondDate: viewModel.selectedDate)) ?
            Design.Calendar.Days.regular : Design.Calendar.Days.futureOrPrevious
        
        cell.dayLabel.textColor = color
        cell.selectedView.isHidden = true
    }
}
