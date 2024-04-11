//
//  AddEntryParamTest.swift
//  GummyDynamoTests
//
//  Created by ヤナ on 4/11/24.
//

import XCTest
@testable import GummyDynamo

class AddEntryParamTest: XCTestCase{

    func testAddStatusReturnsCorrectTime() {
        var entry = Entry.EntryBuilder().build()
        var addEntryParam = AddEntryParam(entry: &entry)
        addEntryParam.addStatus(entryStatus: .ok)
        
        let entryTimeStamp = entry.getStatusMap()[.ok]
        let now = Date()
        let calendar = Foundation.Calendar.current
        let components = calendar.dateComponents([.year,.month, .day, .hour, .minute], from: now)
        let currentTime = calendar.date(from: components)!
        print("From test currentTime: ", currentTime)
        XCTAssertEqual(currentTime, entryTimeStamp?[0])
        
    }
    
}
