//
//  Entry.swift
//  GummyDynamo
//
//  Created by ヤナ on 4/10/24.
//

import Foundation

class Entry {
    private var statusList: [EntryStatus: [Date]]
    private var craving: Craving?
    private var cravingList: [Craving]
    
    init(builder: EntryBuilder) {
        self.statusList = builder.statusList
        self.craving = builder.craving
        self.cravingList = builder.cravingList
    }
    
    func getStatusMap() -> [EntryStatus: [Date]] {
        return statusList
    }
    
    func getCravings() -> [Craving] {
        return cravingList
    }
    
    
    class EntryBuilder {
         var craving: Craving?
         var statusList = [EntryStatus: [Date]]()
         var cravingList = [Craving]()
        
        init() {
            self.cravingList = [Craving]()
            self.statusList = [EntryStatus: [Date]]()
        }
        
        func withCraving(craving: Craving) -> EntryBuilder {
            self.craving = craving
            self.cravingList.append(craving)
            return self
        }
        func build() -> Entry {
            return Entry(builder: self)
        }
    }
    

}
