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
        calendar.delegate.self
        // Do any additional setup after loading the view.
    }

    func calendar(_calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("selected")
    }
}

