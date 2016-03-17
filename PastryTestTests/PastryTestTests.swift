//
//  PastryTestTests.swift
//  PastryTestTests
//
//  Created by Rob Fahrni on 3/22/15.
//  Copyright (c) 2015 Robert R. Fahrni. All rights reserved.
//

import UIKit
import XCTest

class PastryTestTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCreatePastryKit() {
        _ = PastryKit()
    }
    
    func testPastryByDay() {
        let expectation = self.expectationWithDescription("Calling PastryKit thoughtByDay")
        
        let pk = PastryKit()
        pk.thoughtByDay(NSDate(), completionHandler: { (pastries, error) -> Void in
            expectation.fulfill()
        })
        self.waitForExpectationsWithTimeout(60) { (error) -> Void in
            XCTFail("timed out waiting on thoughtByDay")
        }
    }
    
    func testPrevious5PastriesFromDate() {
        let expectation = self.expectationWithDescription("Calling PastryKit thoughtByDay, previous five entries")

        let pk = PastryKit()
        pk.thoughtByDay(NSDate(), previous:5, completionHandler:{ (pastries, error) -> Void in
            expectation.fulfill()
        })
        self.waitForExpectationsWithTimeout(60) { (error) -> Void in
            XCTFail("timed out waiting on thoughtByDay, previous five entries")
        }
    }

    func testNext5PastriesFromDate() {
        let expectation = self.expectationWithDescription("Calling PastryKit thoughtByDay, next five entries")

        let pk = PastryKit()
        pk.thoughtByDay(NSDate(), next:5, completionHandler:{ (pastries, error) -> Void in
            expectation.fulfill()
        })
        self.waitForExpectationsWithTimeout(60) { (error) -> Void in
            XCTFail("timed out waiting on thoughtByDay, next five entries")
        }
    }
    
    func testPastriesFromDateToDate() {
        let expectation = self.expectationWithDescription("Calling PastryKit thoughtByDay, from date to date")
        
        let pk = PastryKit()
        pk.thoughtByDay(NSDate(), to:NSDate(), completionHandler:{ (pastries, error) -> Void in
            expectation.fulfill()
        })
        self.waitForExpectationsWithTimeout(60) { (error) -> Void in
            XCTFail("timed out waiting on thoughtByDay, from date to date")
        }
    }

    func testPastriesByBaker() {
        let expectation = self.expectationWithDescription("Calling PastryKit thoughtsByBaker, thoughts by Baker")
        
        let pk = PastryKit()
        pk.thoughtsByBaker("mike-monteiro", completionHandler:{ (pastries, error) -> Void in
            expectation.fulfill()
        })
        self.waitForExpectationsWithTimeout(60) { (error) -> Void in
            XCTFail("timed out waiting on thoughtsByBaker, thoughts by Baker")
        }
    }

    // Not for the faint of heart. I've never been patient enough to wait for a result set.
    // Yes, you should read that as "This takes forever to collect every thought."
    func testAllPastries() {
        let expectation = self.expectationWithDescription("Calling PastryKit allThoughts")

        let pk = PastryKit();
        pk.allThoughts({ (pastries, error) -> Void in
            expectation.fulfill()
        })
        self.waitForExpectationsWithTimeout(60) { (error) -> Void in
            XCTFail("timed out waiting on allThoughts")
        }
    }
}
