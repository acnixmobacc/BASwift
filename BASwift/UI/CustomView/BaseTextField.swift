//
//  BaseTextField.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 01/04/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol BaseTextFieldDelegate: class {
    func cancelButtonClicked(_ textField: BaseTextField)
    func doneButtonClicked(_ textField: BaseTextField)
}

open class BaseTextField: UITextField, UITextFieldDelegate {

    weak var baseDelegate: BaseTextFieldDelegate?

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
        prepareViewComponent()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        prepareViewComponent()
    }

    public func prepareViewComponent() {
        addToolbar()
    }

    public func addToolbar() {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.backgroundColor = UIColor.white
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.lightGray
        let doneButton = UIBarButtonItem(title: "Tamam", style: UIBarButtonItemStyle.done,
                                         target: self, action: #selector(donePressed))
        let cancelButton = UIBarButtonItem(title: "Vazgeç", style: UIBarButtonItemStyle.plain,
                                           target: self, action: #selector(cancelPressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace,
                                          target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()

        delegate = self
        inputAccessoryView = toolBar
    }

    @objc
    public func donePressed() {
        resignFirstResponder()
        baseDelegate?.doneButtonClicked(self)

    }
    @objc
    public func cancelPressed() {
        resignFirstResponder()
        baseDelegate?.cancelButtonClicked(self)
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }

    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

    override open func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let textRect = super.rightViewRect(forBounds: bounds)
        return textRect
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height)
    }
}
