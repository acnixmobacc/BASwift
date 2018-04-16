//
//  StackTest.swift
//  BASwiftTests
//
//  Created by Burak Akkaya on 16.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import XCTest
import BASwift

class StackTest: XCTestCase {
    
    var stack = BASStack<Int>()
    var element1 = 1
    var element2 = 2
    var element3 = 3
    var element4 = 4
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        stack.push(element1)
        stack.push(element2)
        stack.push(element3)
        stack.push(element4)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        stack = BASStack<Int>()
    }
    
    func testPush(){
        let newStack = BASStack<Int>()
        newStack.push(element1)
        newStack.push(element2)
        XCTAssertEqual(newStack.count, 2)
    }
    
    func testCount(){
        XCTAssertEqual(stack.count, 4)
    }
    
    func testIsEmptyCorrect(){
        let newStack = BASStack<Int>()
        XCTAssertTrue(newStack.isEmpty)
    }
    
    func testIsEmptyFail(){
        let newStack = BASStack<Int>()
        newStack.push(element1)
        newStack.push(element2)
        XCTAssertFalse(newStack.isEmpty)
    }
    
    func testPop(){
        XCTAssertEqual(stack.pop()!, element4)
    }
    
    func testAfterPop(){
        stack.pop()
        XCTAssertEqual(stack.peek()!, element3)
    }
    
    func testPopNil(){
        let newStack = BASStack<Int>()
        XCTAssertTrue(newStack.pop() == nil)
    }
    
    func testPeek(){
        XCTAssertEqual(stack.peek()!, element4)
    }
    
    func testAfterPeek(){
        var _ = stack.peek()
        XCTAssertEqual(stack.peek()!, element4)
    }
    
    func testPeekNil(){
        let newStack = BASStack<Int>()
        XCTAssertTrue(newStack.peek() == nil)
    }
    
    
}
