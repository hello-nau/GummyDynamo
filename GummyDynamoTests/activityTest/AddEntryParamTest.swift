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
        let entry = Entry.EntryBuilder().build()
        let addEntryParam = AddEntryParam(entry: entry)
        addEntryParam.addStatus(entryStatus: .ok)
        
        let entryTimeStamp = entry.getStatusMap()[.ok]
        let now = Date()
        let calendar = Foundation.Calendar.current
        let components = calendar.dateComponents([.year,.month, .day, .hour, .minute], from: now)
        let currentTime = calendar.date(from: components)!
        print("From test currentTime: ", currentTime)
        XCTAssertEqual(currentTime, entryTimeStamp?[0])
    }
    func testAddStatusAddsTwoTimes(){
        let entry = Entry.EntryBuilder().build()
        let addEntryParam = AddEntryParam(entry: entry)
        
        addEntryParam.addStatus(entryStatus: .ok)
        addEntryParam.addStatus(entryStatus: .ok)
        
        let entryTimestamp = entry.getStatusMap()[.ok]
        XCTAssertEqual(entryTimestamp?.count, 2)
    }
    
    func testAddStatusHas2Entries() {
        let entry = Entry.EntryBuilder().build()
        let addEntryParam = AddEntryParam(entry: entry)
        addEntryParam.addStatus(entryStatus: .ok)
        addEntryParam.addStatus(entryStatus: .hungry)

        let entryTimestamp = entry.getStatusMap()[.hungry]
        let now = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: now)
        let currentTime = calendar.date(from: components)!
        
        let statusMap = entry.getStatusMap()

        XCTAssertEqual(statusMap.count, 2)
     
        XCTAssertTrue(entry.getStatusMap().keys.contains(.hungry))
    }
    
    func testAddCraving() {
        let entry = Entry.EntryBuilder().build()
        let addEntryParam = AddEntryParam(entry: entry)
        addEntryParam.addCraving(craving: "Gummy")

        let expected = "Gummy"
        let actual = entry.getCravings()[0].getCraving()

        XCTAssertEqual(expected, actual, "Cravings should match.")
    }
    func testAddMultipleCraving() {
        let entry = Entry.EntryBuilder().build()
        let addEntryParam = AddEntryParam(entry: entry)
        addEntryParam.addCraving(craving: "Gummy")
        addEntryParam.addCraving(craving: "Bear")
        addEntryParam.addCraving(craving: "Candy")

        let expected = "Bear"
        let actual = entry.getCravings()[1].getCraving()

        XCTAssertEqual(expected, actual, "Cravings should match.")
        XCTAssertEqual(3, entry.getCravings().count)
    }
}
