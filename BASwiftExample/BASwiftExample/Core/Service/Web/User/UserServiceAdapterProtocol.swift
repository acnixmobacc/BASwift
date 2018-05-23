//
//  ICampaignServiceAdapter.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

public protocol UserServiceAdapterProtocol {
    func getUser(onSuccess : @escaping (User) -> Void, onError:@escaping (Error?) -> Void)
}
