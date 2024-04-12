//
//  ViewController.swift
//  GummyDynamo
//
//  Created by ヤナ on 4/10/24.
//
import FSCalendar
import UIKit

class ViewController: UIViewController, FSCalendarDelegate {

    @IBOutlet var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        calendar.delegate.self  - initial try, was set to false
//        calendar.dataSource = self ?? chatGPT suggested showed err
        calendar.delegate = self
        print("Calendar delegate set to self: \(calendar.delegate === self)")
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let string = formatter.string(from: date)
        print(string)
    }


}

