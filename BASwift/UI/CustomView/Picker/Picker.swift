//
//  Picker.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 03/04/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

protocol PickerDelegate: class {
    func onSelectItem(row: Int)
}

open class Picker: NSObject {
    var data: [String]!
    var lastSelectedRow: Int?
    var inputTextField: PickerTextField!

    private var _pickerView: UIPickerView!

    var pickerView: UIPickerView! {
        get {
            if _pickerView == nil {
                self._pickerView = UIPickerView()
            }

            return _pickerView
        }

        set(value) {
            _pickerView = value
            _pickerView.delegate = self
            _pickerView.dataSource = self
            _pickerView.showsSelectionIndicator = true
        }
    }

    weak var delegate: PickerDelegate?

    init(dataArray: [String], inputTextField: BaseTextField) {
        super.init()
        self.pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        self.data = dataArray
        if let pickerTextField = inputTextField as? PickerTextField {
            self.inputTextField = pickerTextField
            self.inputTextField.inputView = self.pickerView
            self.inputTextField.baseDelegate = self
        }
        lastSelectedRow = data.index(of: inputTextField.text!)
    }

}

extension Picker: UIPickerViewDataSource {

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

extension Picker: UIPickerViewDelegate {

    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if data.count != 0 && data != nil {
            return data[row]
        }
        return ""
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if data.count != 0 && data != nil {
            inputTextField.text = data[row]
        }
    }

}

extension Picker: BaseTextFieldDelegate {

    public func cancelButtonClicked(_ textField: BaseTextField) {
        if let selectedRow = lastSelectedRow {
            inputTextField.text = data[selectedRow]
            delegate?.onSelectItem(row: selectedRow)
        } else {
            inputTextField.text = .Empty
        }

    }

    public func doneButtonClicked(_ textField: BaseTextField) {
        if (textField.text?.length == 0) {
            self.pickerView.selectRow(0, inComponent: 0, animated: false)
            self.pickerView(self.pickerView, didSelectRow: 0, inComponent: 0)
            lastSelectedRow = 0
        }
        if (data.count != 0 && data != nil && textField.text?.length != 0) {
            delegate?.onSelectItem(row: data.index(of: textField.text!)!)
            lastSelectedRow = data.index(of: textField.text!)!
        }
    }

}
