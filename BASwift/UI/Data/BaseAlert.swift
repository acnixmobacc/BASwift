//
//  BaseAlert.swift
//  
//
//  Created by Burak Akkaya on 10/11/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import Foundation

open class BaseAlert {
    public var message: String
    public var title: String
    public var handler: ((Any) -> Void)?

    public init(message: String = "", title: String = "", handler: ((Any) -> Void)? = nil) {
        self.message = message
        self.title = title
        self.handler = handler
    }
}
