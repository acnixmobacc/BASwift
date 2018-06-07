//
//  Brand.swift
//  BASwiftExampleTests
//
//  Created by Burak Akkaya on 7.06.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

class Team:Codable{
    
    var teamName:String
    var captain:String
    
    init(teamName:String, captain:String) {
        self.teamName = teamName
        self.captain = captain
    }
}
