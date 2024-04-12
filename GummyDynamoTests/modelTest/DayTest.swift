//
//  DayTest.swift
//  GummyDynamoTests
//
//  Created by ヤナ on 4/11/24.
//

import XCTest
@testable import GummyDynamo

class DayTest: XCTestCase {
    
    func testDayCravingsAdded() {
        let day = Day()
        day.addCraving(craving: "KEK")
        XCTAssertEqual(day.getCravingsForTheDay().count, 1)
    }
    func testDayStatusAdded() {
        let day = Day()
        day.addStatus(status: "ok")
        XCTAssertEqual(day.getStatusForTheDay().count, 1)
    }
    func testDayMultipleStatusAdded() {
        let day = Day()
        day.addStatus(status: "ok")
        day.addStatus(status: "light")
        day.addStatus(status: "ok")
        day.addStatus(status: "hungry")
        XCTAssertEqual(day.getStatusForTheDay().count, 3)
    }
    func testDayMultipleTimestampsForTheStatusAdded() {
        let day = Day()
        day.addStatus(status: "ok")
        day.addStatus(status: "light")
        
        let currentTime = Date()
        
        day.addStatus(status: "ok")
        day.addStatus(status: "hungry")
        
        XCTAssertEqual(day.getStatusForTheDay()[.ok]?[1], currentTime)
        
    }
    func testDayCorrectDate() {
        let day = Day()
        let date = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        
        let expected = Int(formatter.string(from: date))
        let actual = day.getTodayDate()
        XCTAssertEqual(expected, actual, "dates should match")

    }
}



