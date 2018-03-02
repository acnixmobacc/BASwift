//
//  UITextField+IXBase.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 22/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import ReactiveCocoa
import ReactiveSwift
import Result
import UIKit

public extension UITextField {
    var onChange: Signal<String?, NoError> {
        return self.reactive.continuousTextValues
    }

    var didChange: Signal<String?, NoError> {
        return self.reactive.textValues
    }
}
