//
//  ViewController.swift
//  sample
//
//  Created by João Pereira on 06/12/2017.
//  Copyright © 2017 nsmyself. All rights reserved.
//

import UIKit
import JTAppleCalendar

class ViewController: UIViewController {

    @IBOutlet weak var calendar: JTAppleCalendarView! {
        didSet {
            calendar.minimumLineSpacing = 0
            calendar.minimumInteritemSpacing = 0
            calendar.selectDates([Date()])
            
            calendar.reloadData()
        }
    }
    
    let viewModel = ViewControllerViewModel()
}
