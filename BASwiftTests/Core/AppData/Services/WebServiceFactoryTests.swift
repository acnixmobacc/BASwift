//
//  DataProviderTests.swift
//  BASwiftTests
//
//  Created by Burak Akkaya on 4.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import XCTest
import BASwift

class WebServiceFactoryTests: XCTestCase {

    var service : WebServiceFactory!
    var serviceResourceForBrandObject : ServiceResource!
    var serviceResourceForBrandList : ServiceResource!
    var expectation: XCTestExpectation!

    override func setUp() {
        super.setUp()
        service = WebServiceFactory()
        serviceResourceForBrandList = ServiceResource.init(withURL: "https://64bd7ddd-bceb-474e-a485-06f861a349f3.mock.pstmn.io/brandList")
        serviceResourceForBrandObject = ServiceResource.init(withURL: "https://64bd7ddd-bceb-474e-a485-06f861a349f3.mock.pstmn.io/brand")
        expectation = XCTestExpectation(description: "Wait response from service")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        service = nil
        serviceResourceForBrandObject = nil
        serviceResourceForBrandList = nil
        expectation = nil
    }
    
    func testGetDataFromService(){
        service.load(request: serviceResourceForBrandObject, onSuccess: {[unowned self] (brandObj:BrandObject) in
            XCTAssertTrue(brandObj.brands[0].name == "Toyota" && brandObj.brands[0].id == "0")
            self.expectation.fulfill()
        }, onError: {error in
            XCTFail("Web service /brand fail")
            self.expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testGetDataListFromService(){
        service.loadList(request: serviceResourceForBrandList, onSuccess: {[unowned self] (brand:[Brand]) in
            XCTAssertTrue(brand[1].name == "Renault" && brand[1].id == "1")
            self.expectation.fulfill()
        }, onError: {[unowned self] error in
            XCTFail("Web service /brandList fail")
            self.expectation.fulfill()
        })
        wait(for: [expectation], timeout: 5)
    }
        
}
