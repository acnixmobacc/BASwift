//
//  MockDataUtilTests.swift
//  BASwiftTests
//
//  Created by Burak Akkaya on 4.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import XCTest
import BASwift


class MockDataUtilTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    func testJSONDataFromFile(){
        let brand : BrandObject = MockDataUtilities.getData(fileName: "data")
        XCTAssertTrue(brand.brands[0].name == "Toyota" && brand.brands[0].id == "0")
    }
    
    func testJSONDataArrayFromFile(){
        let brand: BrandList = MockDataUtilities.getData(fileName: "data_array")
        XCTAssertTrue(brand.list[1].name == "Renault" && brand.list[1].id == "1")
    }

}

