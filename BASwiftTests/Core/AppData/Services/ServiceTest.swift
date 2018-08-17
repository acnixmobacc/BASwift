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

    var service : BAWebService!
    var request2 : Request!
    var request1 : Request!
    var request3 : Request!
    var request4 : Request!
    var expectation: XCTestExpectation!

    override func setUp() {
        super.setUp()
        service = BAWebService.init(withConfig: BAWebServiceConfig.init(baseURL: "http://localhost:8000"))
        request1 = Request(endpoint: "/brands.json")
        request2 = Request(endpoint: "/brandlist.json")
        request3 = Request(endpoint: "/user.json")
        request4 = Request(endpoint: "/car_detail.json")
        expectation = XCTestExpectation(description: "Wait response from service")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        service = nil
        request2 = nil
        request1 = nil
        request3 = nil
        request4 = nil
        expectation = nil
    }
    
    func testGetDataFromService(){
        service.execute(request: request1, onResponse: {[unowned self] (response:Response<BrandObject>) in
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
    
    func testNilDataFromService(){
        service.execute(request: request1, onResponse: {[unowned self] (response:Response<BrandList>) in
            XCTAssertNil(response.entity)
            self.expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testGetDataListFromService(){
        service.execute(request: request2, onResponse: {[unowned self] (response:Response<BrandList>) in
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
    
    func testNestedObjectResponseFromService(){
        service.execute(request: request3, onResponse: {[unowned self] (response:Response<User>) in
            guard let entity = response.entity else{
                XCTFail("Entity is nil")
                self.expectation.fulfill()
                return
            }
            XCTAssertTrue(entity.favouriteBrands[1].name == "Opel" && entity.favouriteBrands[1].id == "2")
            self.expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5)
    }
    
    func testCustomCodingKeys(){
        service.execute(request: request4, onResponse: {[unowned self] (response:Response<CarDetail>) in
            guard let entity = response.entity else{
                XCTFail("Entity is nil")
                self.expectation.fulfill()
                return
            }
            XCTAssertTrue(entity.brandName == "Toyota" && entity.id == "0" && entity.name == "Auris"
                && entity.logoURL == "https://www.toyota.com.tr/images/toyota-logo.jpg")
            self.expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5)
    }
        
}
