//
//  LinkedListTest.swift
//  BASwiftTests
//
//  Created by Burak Akkaya on 16.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import XCTest
import BASwift

class LinkedListTest: XCTestCase {
    
    var linkedList = BASLinkedList<String>()
    let firstValue = "Value-1"
    let secondValue = "Value-2"
    let thirdValue = "Value-3"
    let lastValue = "Value-4"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        linkedList.append(value: firstValue)
        linkedList.append(value: secondValue)
        linkedList.append(value: thirdValue)
        linkedList.append(value: lastValue)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        linkedList = BASLinkedList<String>()
    }
    
    func testIsEmptyCorrect(){
        let emptyLinkedList = BASLinkedList<String>()
        XCTAssertTrue(emptyLinkedList.isEmpty)
    }
    
    func testIsEmptyFail(){
        let notEmptyLinkedList = BASLinkedList<String>()
        notEmptyLinkedList.append(value: "Burak Akkaya")
        XCTAssertFalse(notEmptyLinkedList.isEmpty)
    }
    
    func testFirstElement(){
        XCTAssertEqual(linkedList.first?.value, firstValue)
    }
    
    func testLastElement(){
        XCTAssertEqual(linkedList.last?.value, lastValue)
    }
    
    func testRemoveAll(){
        linkedList.removeAll()
        XCTAssertTrue(linkedList.isEmpty)
    }
    
    func testRemove(){
        let newLinkedList = BASLinkedList<String>()
        let node1 = BASLinkedNode<String>(value: "Node1")
        let node2 = BASLinkedNode<String>(value: "Node2")
        newLinkedList.append(newNode: node1)
        newLinkedList.append(newNode: node2)
        XCTAssertTrue(linkedList.remove(node: node2)! == "Node2")
    }
    
    func testRemoveToEmpty(){
        let newLinkedList = BASLinkedList<String>()
        let node1 = BASLinkedNode<String>(value: "Node1")
        newLinkedList.append(newNode: node1)
        linkedList.remove(node: node1)
        XCTAssertTrue(linkedList.isEmpty)
    }
    
    func testNodeValueAtIndex(){
        XCTAssertEqual(linkedList.node(atIndex: 2)?.value, thirdValue)
    }
    
    func testOutOfIndexNode(){
        XCTAssertTrue(linkedList.node(atIndex: 5) == nil)
    }
    
    
}
