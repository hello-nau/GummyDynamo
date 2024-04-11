//
//  AddEntryParam.swift
//  GummyDynamo
//
//  Created by ヤナ on 4/10/24.
//

import Foundation

class AddEntryParam {
    private var entry: Entry
    
    init(entry: Entry) {
        self.entry = entry
    }
    
    func addStatus(entryStatus: EntryStatus) {
        var statusMap = entry.getStatusMap()
        
        if statusMap[entryStatus] == nil {
            statusMap[entryStatus] = [Date().roundedToSeconds()]
        } else {
            var list = statusMap[entryStatus]!
            statusMap[entryStatus]?.append(Date().roundedToSeconds())
        }
    }
    
    func addCraving(craving: String) {
        var cravingList = entry.getCravings()
        cravingList.append(Craving(craving: craving))
    }
}

extension Date {
        func roundedToSeconds() -> Date {
            let cal = Foundation.Calendar.current
            let roundedDate = cal.date(bySetting: .second, value: 0, of: self)
            return roundedDate ?? self
        }
    }


