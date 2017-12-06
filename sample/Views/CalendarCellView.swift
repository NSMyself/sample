//
//  CalendarCellView.swift
//  sample
//
//  Created by João Pereira on 06/12/2017.
//  Copyright © 2017 nsmyself. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarCellView: JTAppleCell {
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var currentDayView: UIView!
}
