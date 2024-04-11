//
//  Calendar.swift
//  GummyDynamo
//
//  Created by ヤナ on 4/11/24.
//

import Foundation

class Calendar {
     let year: Int
    var months: [Int: [Int: Day]] = [:]
    
    init(year: Int) {
        self.year = year
        for month in 1...12 {
            var days: [Int: Day] = [:]
            let dateComponents = DateComponents(year: year, month: month)
            let calendar = NSCalendar.current
            let date = calendar.date(from: dateComponents)
            let defaultDate = Date()
            let range = calendar.range(of: .day, in: .month, for: date ?? defaultDate)!
            let numDays = range.count
            for day in 1...numDays {
                days[day] = Day()
            }
            months[month] = days
        }
        
    }
    
    static func isLeapYear(year: Int) -> Bool {
        return (year % 4==0 && year % 100 != 0) || (year%400 == 0)
    }
    func getMonths() -> [Int: [Int: Day]] {
        return months
    }
}
