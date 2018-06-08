//
//  RealmNestedObjectTest.swift
//  BASwiftExampleTests
//
//  Created by Burak Akkaya on 7.06.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import XCTest
import RealmSwift
@testable import BASwiftExample

class RealmNestedObjectTest: XCTestCase {
    
    var realmManager : RealmManagerProtocol!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let team:Team = Team.init(teamName: "Trabzonspor", captain: "Recep Onur Kıvrak")
        let teamData = try? JSONEncoder().encode(team)
        let user:RLMUser = RLMUser(value: ["name":"Burak", "surname":"Akkaya", "team":teamData])
        
        realmManager = RealmManager()
        realmManager.open(withConfig: Realm.Configuration.defaultConfiguration)
        realmManager.add(object: user)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        realmManager.remove(type: RLMUser.self)
        realmManager = nil
    }
    
    func testNestedObjectWriteSuccess(){
        guard let user = realmManager.get(type: RLMUser.self) else{
            XCTFail("User not found")
            return
        }
        
        guard let team = user.getTeam() else {
            XCTFail("Team is nil")
            return
        }
        
        XCTAssertTrue(user.name == "Burak" && user.surname == "Akkaya" && team.captain == "Recep Onur Kıvrak" && team.teamName == "Trabzonspor")
    }
}
