//
//  Day.swift
//  GummyDynamo
//
//  Created by ヤナ on 4/10/24.
//

import Foundation

class Day {
    private let date: Date
    private var entry: Entry
    private var addEntryParam: AddEntryParam
    
    
    init() {
        self.entry = Entry.EntryBuilder().build()
        self.addEntryParam = AddEntryParam(entry: &self.entry)
        self.date = Date()
    }
    
    func getTodayDate() -> Int {
        let calendar = Foundation.Calendar.current
        return calendar.component(.day, from: date)
    }
    
    func addCraving(craving: String) {
        addEntryParam.addCraving(craving: craving)
    }
    
    func addStatus(status : String) {
        if let entryStatus = EntryStatus(rawValue: status) {
                    addEntryParam.addStatus(entryStatus: entryStatus)
                } else {
                    print("Invalid entry status string: \(status)")
                }
    }
    
    func getCravingsForTheDay() -> [Craving] {
        return entry.getCravings()
    }
    
    func getStatusForTheDay() -> [EntryStatus: [Date]] {
        return entry.getStatusMap()
    }
    
}
