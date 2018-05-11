//
//  PickerTextFieldDelegate.swift
//  Alamofire
//
//  Created by Burak Akkaya on 10.05.2018.
//

import Foundation

// MARK: - Picker TextField Delegate
public protocol PickerTextFieldDelegate: class {
    func onSelect(value: String)

    func didSelect(value: String)

    func didCancel(value: String)
}
