//
//  DataProviderTests.swift
//  BASwiftTests
//
//  Created by Burak Akkaya on 4.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import XCTest
import BASwift

class ServiceTest: XCTestCase {

    var service : Service!
    var request2 : Request!
    var request1 : Request!
    var expectation: XCTestExpectation!

    override func setUp() {
        super.setUp()
        service = Service.init(withConfig: ServiceConfig.init(baseURL: "https://64bd7ddd-bceb-474e-a485-06f861a349f3.mock.pstmn.io"))
        request1 = Request(endpoint: "/brandList")
        request2 = Request(endpoint: "/brand")
        expectation = XCTestExpectation(description: "Wait response from service")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        service = nil
        request2 = nil
        request1 = nil
        expectation = nil
    }
    
    func testGetDataFromService(){
        service.execute(request: request2, onResponse: {[unowned self] (response:Response<BrandObject>) in
            guard let entity = response.entity else{
                XCTFail("Entity is nil")
                self.expectation.fulfill()
                return
            }
            XCTAssertTrue(entity.brands[0].name == "Toyota" && entity.brands[0].id == "0")
            self.expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testGetDataListFromService(){
        service.execute(request: request1, onResponse: {[unowned self] (response:Response<BrandList>) in
            guard let entity = response.entity else{
                XCTFail("Entity is nil")
                self.expectation.fulfill()
                return
            }
            XCTAssertTrue(entity.list[1].name == "Renault" && entity.list[1].id == "1")
            self.expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5)
    }
        
}
