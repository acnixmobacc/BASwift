//
//  FormViewModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 29.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import RxSwift

class FormViewModel : BABaseViewModel{
    
    var username = Variable<String>("")
    var surname = Variable<String>("")
    var password = Variable<String>("")
    var birthdate = Variable<String>("")
    var city = Variable<String>("")
    var town = Variable<String>("")
    var address = Variable<String>("")
    var phone = Variable<String>("")
    
    fileprivate let cities = ["İstanbul", "Trabzon", "İzmir", "Ankara", "Artvin", "Mardin", "Diyarbakır"]
    fileprivate let cityTownsMap = ["İstanbul" : [],
                                    "Trabzon" : [],
                                    "İzmir" : [],
                                    "Ankara" : [],
                                    "Artvin": [],
                                    "Mardin" : [],
                                    "Diyarbakır" : []]
    
    override func onDidLoad() {
        super.onDidLoad()
    }
    
    func getCities() -> [String]{
        return cities
    }
    
    func onClickSave(){
        print("Click")
    }
    
    func getTown(forCity city : String) -> [String]{
        if let towns = cityTownsMap[city] as? [String]{
            return towns
        }
    
        return []
    }
    
}
