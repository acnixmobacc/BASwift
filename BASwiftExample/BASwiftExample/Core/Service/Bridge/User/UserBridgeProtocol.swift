//
//  IUserBridge.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

public protocol UserBridgeProtocol {

    func getUser( onSuccess: @escaping (User) -> Void, onFailure: @escaping (Error?) -> Void)
}
