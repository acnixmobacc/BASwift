//
//  TextFieldItemView.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 8.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class TextFormItemView: UIView, IFormItemView {

    // MARK: - Properties
    var value: Any? {
        return textField.text
    }

    // MARK: - Block Methods
    var onValidation: (() -> Bool)?

    // MARK: - UI Fields
    @IBOutlet weak private var textField: UITextField!

    // MARK: - Methods
    func setupUI(placeholder: String, isSecureTextEntry: Bool = false) {
        textField.placeholder = placeholder
        textField.isSecureTextEntry = isSecureTextEntry
        textField.returnKeyType = .done
        textField.delegate = self
    }

    func showError() {
        Logger.debug("Show Error")
    }
}

extension TextFormItemView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
