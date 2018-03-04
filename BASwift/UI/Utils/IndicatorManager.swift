//
//  AlertViewUtilities.swift
//  
//
//  Created by Burak Akkaya on 02/11/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import Foundation

open class IndicatorManager {
    public enum IndicatorStatus {
        case start
        case notChange
        case stop
    }
    private var _status: IndicatorStatus = .stop
    private var _bussyCount: Int = 0

    private var bussyCount: Int {
        set(value) {
            if _bussyCount == 0 && value == 1 {
                _bussyCount = 1
                status = .start
            } else if _bussyCount > 0 && value >= 1 {
                _bussyCount = value
                status = .notChange
            } else {
                _bussyCount = 0
                status = .stop
            }
        }
        get {
            return _bussyCount
        }
    }

    public var status: IndicatorStatus {
        set(value) {
            _status = value
        }
        get {
            return _status
        }
    }

    public init() {
        bussyCount = 0
    }

    public func onStatusChanged(_ isBussy: Bool) {
        bussyCount = isBussy ? bussyCount + 1 : bussyCount - 1
    }

    public func dismiss() {
        bussyCount = 0
    }
}
