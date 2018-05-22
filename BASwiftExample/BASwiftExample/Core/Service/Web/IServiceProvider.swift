//
//  IServiceProvider.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

public protocol IServiceProvider {

    func getCarServiceAdapter() -> ICarServiceAdapter

    func getCampaignServiceAdapter() -> ICampaignServiceAdapter
}
