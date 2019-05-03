//
//  BaseTextField.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 01/04/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

// MARK: - Toolbar Options
public struct ToolbarOptions {
    public let barStyle: UIBarStyle
    public let tintColor: UIColor
    public let barTintColor: UIColor?
    public let isTranslucent: Bool
    public let doneButtonStyle: UIBarButtonItem.Style
    public let doneButtonTintColor: UIColor
    public let doneButtonText: String
    public let cancelButtonStyle: UIBarButtonItem.Style
    public let cancelButtonTintColor: UIColor
    public let cancelButtonText: String

    public init(barStyle: UIBarStyle = .default, tintColor: UIColor = .clear, barTintColor: UIColor? = nil,
                isTranslucent: Bool = false, doneButtonStyle: UIBarButtonItem.Style = .done, doneButtonTintColor: UIColor = .black,
                doneButtonText: String = "Tamam", cancelButtonStyle: UIBarButtonItem.Style = .done, cancelButtonTintColor: UIColor = .black,
                cancelButtonText: String = "Vazgeç") {
        self.barStyle = barStyle
        self.tintColor = tintColor
        self.barTintColor = barTintColor
        self.isTranslucent = isTranslucent
        self.doneButtonStyle = doneButtonStyle
        self.doneButtonTintColor = doneButtonTintColor
        self.doneButtonText = doneButtonText
        self.cancelButtonStyle = cancelButtonStyle
        self.cancelButtonTintColor = cancelButtonTintColor
        self.cancelButtonText = cancelButtonText
    }

    public static let `default` : ToolbarOptions = {
        return ToolbarOptions(tintColor: .lightGray, barTintColor: .white, isTranslucent: true)
    }()
}

// MARK: - Picker Delegate
extension PickerTextField: PickerDelegate {
    public func onSelectItem(value: String) {
        self.text = value
        pickerDelegate?.onSelect(value: value)
    }
}

// MARK: - Picker Text Field
open class PickerTextField: UITextField, UITextFieldDelegate {

    // MARK: - Properties
    fileprivate var picker: Picker?

    weak public var pickerDelegate: PickerTextFieldDelegate?

    open var toolbarOptions: ToolbarOptions {
        return ToolbarOptions.default
    }

    // MARK: - Initialization
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
        prepareViewComponent()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        prepareViewComponent()
    }

    // MARK: - Methods
    open func setPickerView(withPicker picker: Picker) {
        self.picker = picker
        setPicker()
    }

    open func setPickerView(withData data: [String], selectedValue: String? = nil) {
        self.picker = Picker(dataArray: data, selectedItem: selectedValue)
        setPicker()
    }

    @objc
    public func donePressed() {
        resignFirstResponder()
        picker?.onClickDone(self)
        pickerDelegate?.didSelect(value: text!)
    }

    @objc
    public func cancelPressed() {
        resignFirstResponder()
        picker?.onClickCancel(self)
        pickerDelegate?.didCancel(value: text!)
    }

    // MARK: - Private Methods
    private func setPicker() {
        guard let picker = self.picker else {
            fatalError("Picker view must be initialized")
        }

        self.inputView = picker.pickerView
        picker.delegate = self

    }

    private func prepareViewComponent() {
        addToolbar()
    }

    fileprivate func addToolbar() {
        let toolBar = UIToolbar()
        toolBar.barStyle = toolbarOptions.barStyle
        toolBar.isTranslucent = toolbarOptions.isTranslucent
        toolBar.tintColor = toolbarOptions.tintColor
        toolBar.barTintColor = toolbarOptions.barTintColor
        let doneButton = UIBarButtonItem(title: toolbarOptions.doneButtonText, style: toolbarOptions.doneButtonStyle,
                                         target: self, action: #selector(donePressed))
        doneButton.tintColor = toolbarOptions.doneButtonTintColor
        let cancelButton = UIBarButtonItem(title: toolbarOptions.cancelButtonText, style: toolbarOptions.cancelButtonStyle,
                                           target: self, action: #selector(cancelPressed))
        cancelButton.tintColor = toolbarOptions.cancelButtonTintColor
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
                                          target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()

        delegate = self
        inputAccessoryView = toolBar
    }
}
