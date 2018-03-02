//
//  UIButton+IXBase.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 22/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//
import UIKit
import ReactiveSwift
import Result

public extension UIButton {

    var onClick: Signal<UIButton, NoError> {
        return self.reactive.controlEvents(.touchUpInside)
    }

    var onDown: Signal<UIButton, NoError> {
        return self.reactive.controlEvents(.touchDown)
    }

    var onCancel: Signal<UIButton, NoError> {
        return self.reactive.controlEvents(.touchCancel)
    }

}
