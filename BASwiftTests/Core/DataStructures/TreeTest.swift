//
//  TreeTest.swift
//  BASwiftTests
//
//  Created by Burak Akkaya on 16.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import XCTest
import BASwift

class TreeTest: XCTestCase {
    
    static var rootNode = BASNode<String>(value: "Application")
    var tree = BASTree<String>(withRootNode: TreeTest.rootNode)
    let parentNode = BASNode<String>(value: "iOS")
    let child1 = BASNode<String>(value: "Objective-C")
    let child2 = BASNode<String>(value: "Swift")
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        tree.add(node: parentNode, toNode: TreeTest.rootNode)
        tree.add(node: child1, toNode: parentNode)
        tree.add(node: child2, toNode: parentNode)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        tree = BASTree<String>(withRootNode: TreeTest.rootNode)
    }
    
    func testAddNode(){
        let rootNode = BASNode<String>(value: "Apple")
        let parent1 = BASNode<String>(value: "Mobile")
        let parent2 = BASNode<String>(value: "Computer")
        let child1 = BASNode<String>(value: "iPad")
        let child2 = BASNode<String>(value: "iPhone")
        
        let appleTree = BASTree<String>(withRootNode: rootNode)
        appleTree.add(node: parent1, toNode: rootNode)
        appleTree.add(node: parent2, toNode: rootNode)
        appleTree.add(node: child1, toNode: parent1)
        appleTree.add(node: child2, toNode: parent1)
        
        XCTAssertNotNil(appleTree.search(value: "Mobile"))
    }
        
}
