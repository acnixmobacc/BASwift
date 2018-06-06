//
//  DoubleExtensionTest.swift
//  BASwiftTests
//
//  Created by Burak Akkaya on 16.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import XCTest

class DoubleExtensionTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testToString() {
        let value:Double = 3.2
        
        XCTAssertEqual(value.toString, "3.2")
    }

    
}
