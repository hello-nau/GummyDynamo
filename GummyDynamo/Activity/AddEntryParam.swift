//
//  AddEntryParam.swift
//  GummyDynamo
//
//  Created by ヤナ on 4/10/24.
//

import Foundation
import UIKit

class AddEntryParam: UIViewController{
    private var entry: Entry
    
    init(entry: Entry) {
        self.entry = entry
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addStatus(entryStatus: EntryStatus) {
        var statusMap = entry.getStatusMap()
        
        if statusMap[entryStatus] == nil {
            statusMap[entryStatus] = [Date().roundedToMinutes()]
            print("If nil", Date().roundedToMinutes())
        } else {
            var list = statusMap[entryStatus]!
            statusMap[entryStatus]?.append(Date().roundedToMinutes())
            print("not nil",  Date().roundedToMinutes())
        }
        entry.setStatusMap(statusMap)
    }
    
    func addCraving(craving: String) {
        var cravingList = entry.getCravings()
        cravingList.append(Craving(craving: craving))
        entry.setCravings(cravingList)
    }
}

extension Date {
        func roundedToMinutes() -> Date {
            let cal = Foundation.Calendar.current
            let roundedDate = cal.date(bySetting: .second, value: 0, of: self)
            let roundedDateToMinute = cal.date(bySetting: .nanosecond, value: 0, of: roundedDate ?? self)
            return roundedDate ?? self
        }
    }
    

 



