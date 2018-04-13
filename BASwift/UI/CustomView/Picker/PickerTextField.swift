//
//  BaseTextField.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 01/04/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

// MARK: - Picker Delegate
extension PickerTextField: PickerDelegate {
    func onSelectItem(value: String) {
        self.text = value
    }
}

// MARK: - Picker Text Field
open class PickerTextField: UITextField, UITextFieldDelegate {

    // MARK: - Properties
    public var picker: Picker?

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

    @objc public func donePressed() {
        resignFirstResponder()
        picker?.onClickDone(self)

    }

    @objc public func cancelPressed() {
        resignFirstResponder()
        picker?.onClickCancel(self)
    }

    // MARK: - Private Methods
    private func setPicker() {
        guard let picker = self.picker else {
            fatalError("Picker view must be initialized")
        }

        self.inputView = picker.pickerView
        picker.delegate = self

    }
}
