//
//  StringExtensionTest.swift
//  BASwiftTests
//
//  Created by Burak Akkaya on 16.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import XCTest

class StringExtensionTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testToInt() {
        let value = "3"
        XCTAssertEqual(value.toInt, 3)
    }
    
    
    func testShouldEmptyCorrect() {
        let value = " "
        XCTAssertEqual(value.shouldEmpty, true)
    }
    
    func testShouldEmptyWrong() {
        let value = " test string"
        XCTAssertEqual(value.shouldEmpty, false)
    }
    
    func testRemoveWhitespace(){
        let value = " Test String test "
        XCTAssertEqual(value.removeWhitespace(), "TestStringtest")
    }
    
    func testReplaceSubString(){
        let value = "aabb bbcc eebb ssbb"
        XCTAssertEqual(value.replace("bb", replacement: "xx"), "aaxx xxcc eexx ssxx")
    }
    
    func testSubstringFromStartToIndex(){
        let value = "aabb bbcc eebb ssbb"
        XCTAssertEqual(value.substring(to: 6), "aabb b")
    }
    
    func testSubstringFromIndexToIndex(){
        let value = "aabb bbcc eebb ssbb"
        XCTAssertEqual(value.substring(from: 4, to: 8), " bbc")
    }
    
    
    func testSubstringFromIndex(){
        let value = "aabb bbcc eebb ssbb"
        XCTAssertEqual(value.substring(from: 4), " bbcc eebb ssbb")
    }
    
    func testContainsCorrect(){
        let value = "aabb bbcc eebb ssbb"
        XCTAssertEqual(value.contains(find: "aa"), true)
    }
    
    func testContainsFail(){
        let value = "aabb bbcc eebb ssbb"
        XCTAssertEqual(value.contains(find: "xx"), false)
    }
    
    func testContainsIgnoreCaseCorrect(){
        let value = "aabb bbcc eebb ssbb"
        XCTAssertEqual(value.contains(find: "AA", ignoreCase:true), true)
    }
    
    func testContainsNotIgnoreCaseCorrect(){
        let value = "aabb bbcc eebb ssbb"
        XCTAssertEqual(value.contains(find: "AA"), false)
    }
    
    
    func testIsNumberCorrect(){
        let value = "31212412412"
        XCTAssertEqual(value.isDecimal, true)
    }
    
    func testIsNumberFalse(){
        let value = "31212asfa412412"
        XCTAssertEqual(value.isDecimal, false)
    }
    
    func testIsMatchCorrect(){
        let regex = "^[^<>!@#$%^&*()0-9]*$"
        let value = "Burak"
        XCTAssertTrue(value.isMatch(regex: regex))
    }
    
    
    func testIsMatchFalse(){
        let regex = "^[^<>!@#$%^&*()0-9]*$"
        let value = "Burak12"
        XCTAssertFalse(value.isMatch(regex: regex))
    }
}
