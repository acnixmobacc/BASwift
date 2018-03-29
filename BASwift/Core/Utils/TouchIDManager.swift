//
//  TouchIDManager.swift
//  TouchIDManager
//
//  Created by Burak Akkaya on 01/06/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//
import Foundation
import LocalAuthentication

public typealias TouchIDSuccessBlock = (Bool) -> Void
public typealias TouchIDErrorBlock = (NSError) -> Void

open class TouchIDManager {

    public init(){}
    
    public func authenticateUser(reasonText: String, successBlock:@escaping TouchIDSuccessBlock,
                           errorBlock:@escaping TouchIDErrorBlock) {
        let context = LAContext()
        var authError: NSError?

        guard context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &authError) else {
            DispatchQueue.main.async {
                errorBlock(authError!)
            }
            return
        }

        context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics,
                               localizedReason: reasonText, reply: { success, error in
                                if success {
                                    successBlock(success)
                                } else {
                                    errorBlock(error! as NSError)
                                }

        })

    }
}
