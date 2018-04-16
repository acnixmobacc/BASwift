//
//  QueueTest.swift
//  BASwiftTests
//
//  Created by Burak Akkaya on 16.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import XCTest
import BASwift

class QueueTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPeekNilElement(){
        let list = BASQueue<Int>()
        XCTAssertTrue(list.peek() == nil)
    }
    
    func testEnqueueElement(){
        let list = BASQueue<Int>()
        list.enqueue(3)
        XCTAssertTrue(list.peek()! == 3)
    }
    
    func testEnqueueMultipleElement(){
        let list = BASQueue<Int>()
        list.enqueue(3)
        list.enqueue(5)
        list.enqueue(7)
        XCTAssertTrue(list.peek()! == 3)
    }
    
    func testDequeueNilElement(){
        let list = BASQueue<Int>()
        
        XCTAssertTrue(list.dequeue() == nil)
    }
    
    func testDequeueElement(){
        let list = BASQueue<Int>()
        list.enqueue(3)
        list.enqueue(5)
        
        XCTAssertEqual(list.dequeue()!, 3)
    }
    
    func testAfterDequeueElement(){
        let list = BASQueue<Int>()
        list.enqueue(3)
        list.enqueue(5)
        list.dequeue()
        
        XCTAssertTrue(list.peek()! == 5)
    }
    
    func testIsEmptyCorrect(){
        let list = BASQueue<Int>()
        XCTAssertTrue(list.isEmpty)
    }
    
    func testIsEmptyFail(){
        let list = BASQueue<Int>()
        list.enqueue(3)
        XCTAssertFalse(list.isEmpty)
    }
    
    
    
}
