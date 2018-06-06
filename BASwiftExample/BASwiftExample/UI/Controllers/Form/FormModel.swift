//
//  FormModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 1.06.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

class FormModel: BaseModel {

    weak var viewModelDelegate: FormViewModelProtocol?

    fileprivate let cities = ["İstanbul", "Trabzon", "İzmir", "Ankara", "Artvin", "Mardin", "Diyarbakır"]

    fileprivate let cityTownsMap = ["İstanbul": [],
                                    "Trabzon": [],
                                    "İzmir": [],
                                    "Ankara": [],
                                    "Artvin": [],
                                    "Mardin": [],
                                    "Diyarbakır": []]

}

extension FormModel: FormModelProtocol {
    func getCities() -> [String] {
        return cities
    }

    func getTown(forCity city: String) -> [String] {
        guard let towns = cityTownsMap[city] as? [String] else {
            return []
        }

        return towns
    }

}
