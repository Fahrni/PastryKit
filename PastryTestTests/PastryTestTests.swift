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
    var done: Bool = false;

    
    override func setUp() {
        super.setUp()
        self.done = false;
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCreatePastryKit() {
        var pk = PastryKit();
    }
    
    func testPastryByDay() {
        var pk = PastryKit();
        pk.thoughtByDay(NSDate(), completionHandler: { (pastries, error) -> Void in
            XCTAssert(pastries != nil, "pastries is nil");
            self.done = true;
        })
        self.runWaitLoop(15);
    }
    
    func testPrevious5PastriesFromDate() {
        var pk = PastryKit();
        pk.thoughtByDay(NSDate(), previous:5, completionHandler:{(pastries, error) -> Void in
            XCTAssert(pastries.count != 0, "pastry count should not be zero");
            self.done = true;
        })
        self.runWaitLoop(15);
    }

    func testNext5PastriesFromDate() {
        var pk = PastryKit();
        pk.thoughtByDay(NSDate(), next:5, completionHandler:{(pastries, error) -> Void in
            XCTAssert(pastries.count != 0, "pastry count should not be zero");
            self.done = true;
        })
        self.runWaitLoop(15);
    }
    
    func testPastriesFromDateToDate() {
        var pk = PastryKit();
        pk.thoughtByDay(NSDate(), to:NSDate(), completionHandler:{(pastries, error) -> Void in
            XCTAssert(pastries.count != 0, "pastry count is 0");
            self.done = true;
        })
    }

    func testPastriesByBaker() {
        var pk = PastryKit();
        pk.thoughtsByBaker("mike-monteiro", completionHandler:{(pastries, error) -> Void in
            XCTAssert(pastries.count != 0, "pastry count is 0");
            self.done = true;
        })
        self.runWaitLoop(15);
    }

    // Not for the faint of heart. I've never been patient enough to wait for a result set.
    // Yes, you should read that as "This takes forever to collect every thought."
//    func testAllPastries() {
//        var pk = PastryKit();
//        pk.allThoughts({(pastries, error) -> Void in
//            XCTAssert(pastries.count != 0, "pastry count is 0");
//            self.done = true;
//        })
//        self.runWaitLoop(60);
//    }
    
    ///
    /// runWaitLoop - Poor Man's asynchronous wait
    ///
    internal func runWaitLoop(delayInSeconds: NSTimeInterval)
    {
        // Reset our _done flag.
        self.done = false
        
        // Get the current run loop.
        var runLoop = NSRunLoop.currentRunLoop()
        var timeout = NSDate(timeInterval: delayInSeconds, sinceDate: NSDate())
        while ((false == self.done)) && NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: timeout) {}
    }
}
