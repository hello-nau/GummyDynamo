//
//  EntryTest.swift
//  GummyDynamoTests
//
//  Created by ヤナ on 4/11/24.
//
import XCTest
@testable import GummyDynamo

class EntryTest: XCTestCase {
    
    func testCreatesEntryWithCraving() {
        let entry = Entry.EntryBuilder()
            .withCraving(craving: Craving(craving: "KEK"))
            .build()
        let cravingList = entry.getCravings()
        XCTAssertEqual(cravingList[0].getCraving(), "KEK", "Craving from an entry and expected one")
    }
    
    
}
