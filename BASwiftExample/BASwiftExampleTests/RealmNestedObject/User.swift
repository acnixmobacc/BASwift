//
//  User.swift
//  BASwiftExampleTests
//
//  Created by Burak Akkaya on 7.06.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import RealmSwift

class RLMUser : Object{
    
    @objc dynamic var name : String = ""
    @objc dynamic var surname: String = ""
    @objc dynamic var team : Data?
    
    func getTeam() -> Team?{
        
        guard let team = team else{
            return nil
        }
        
        return try? JSONDecoder().decode(Team.self, from: team)
    }
}
