//
//  LocalDataSourceTests.swift
//  BASwiftExampleTests
//
//  Created by Burak Akkaya on 29.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import XCTest
@testable import BASwiftExample

class LocalDataSourceTests: XCTestCase {
    
    let localUserDataSource : LocalDataSource<LocalUser> = LocalDataSource.init(manager: RealmManager.init())
    let localBrandDataSource : LocalDataSource<LocalBrands> = LocalDataSource.init(manager: RealmManager.init())
    let testUser1 = LocalUser.init(value: ["name": "Sam", "surname":"James", "tckn":"12345667899"])
    let testUser2 = LocalUser.init(value: ["name": "John", "surname":"Stones", "tckn":"65621495161"])
    let testBrand = LocalBrands.init(value: ["brandName": "Ferrari", "brandImageUrl":"xxxx"])
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        localUserDataSource.add(object: testUser1)
        localUserDataSource.add(object: testUser2)
        localBrandDataSource.add(object: testBrand)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        localUserDataSource.removeAll()
        localBrandDataSource.removeAll()
    }
    
    func testRemoveAll1(){
        localUserDataSource.removeAll()
        XCTAssertTrue(localUserDataSource.getAll().isEmpty)
    }
    
    func testRemoveAll2(){
        localUserDataSource.removeAll()
        XCTAssertTrue(localUserDataSource.getAll().isEmpty && !localBrandDataSource.getAll().isEmpty)
    }
    
    func testRemoveAllDB(){
        let realmManager = RealmManager()
        realmManager.open()
        realmManager.removeAll()
        XCTAssertTrue(localUserDataSource.getAll().isEmpty && localBrandDataSource.getAll().isEmpty)
    }
    
    func testRemove1(){
        localUserDataSource.remove(object: testUser1)
        XCTAssertTrue(localUserDataSource.getAll().count == 1)
    }
    
    func testRemove2(){
        localUserDataSource.remove(object: testUser1)
        XCTAssertTrue(localUserDataSource.get()?.name == "John")
    }
    
    func testAdd1(){
        localUserDataSource.add(object: testUser1)
        let user = localUserDataSource.get()
        XCTAssertNotNil(user)
    }
    
    func testAdd2(){
        localUserDataSource.add(object: testUser1)
        let user = localUserDataSource.get()
        XCTAssertTrue(user?.name == "Sam")
    }
    
    func testAdd3(){
        let user = localUserDataSource.get()
        XCTAssertTrue(user?.name == "Sam")
    }

    func testFind1(){
        let user = localUserDataSource.find(query: "name = 'Sam'")
        XCTAssertNotNil(user)
    }
    
    func testFind2(){
        let user = localUserDataSource.find(query: "name = 'Lebron'")
        XCTAssertNil(user)
    }
    
    func testGetDefault1(){
        localUserDataSource.removeAll()
        let defaultObj = LocalUser.init()
        XCTAssertEqual(localUserDataSource.get(withDefault: defaultObj), defaultObj)
    }
    func testGetDefault2(){
        let defaultObj = LocalUser.init()
        XCTAssertNotEqual(localUserDataSource.get(withDefault: defaultObj), defaultObj)
    }
}
