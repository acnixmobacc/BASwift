//
//  FormManager.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 7.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

protocol FormManagerDelegate: class {
    func onDone(errorStack: BASStack<String>)
}

public class FormManager {

    // MARK: - Properties
    fileprivate var parentView: UIView

    weak var delegate: FormManagerDelegate?

    public var formView: FormView

    var errorStack: BASStack<String>

    // MARK: - Form Items
    private lazy var usernameItem: TextFormItemView = {
        let instance = TextFormItemView.fromNib()
        instance.setupUI(placeholder: "Name")
        return instance
    }()

    private lazy var surnameItem: TextFormItemView = {
        let instance = TextFormItemView.fromNib()
        instance.setupUI(placeholder: "Surname")
        return instance
    }()

    private lazy var passwordItem: TextFormItemView = {
        let instance = TextFormItemView.fromNib()
        instance.setupUI(placeholder: "Password", isSecureTextEntry: true)
        return instance
    }()

    private lazy var birthdateItem: DatePickerFormItemView = {
        let instance = DatePickerFormItemView.fromNib()
        instance.setupUI(placeholder: "Birthdate")
        return instance
    }()

    private lazy var cityItem: PickerFormItemView = {
        let instance = PickerFormItemView.fromNib()
        instance.setupUI(placeholder: "City")
        return instance
    }()

    private lazy var townItem: PickerFormItemView = {
        let instance = PickerFormItemView.fromNib()
        instance.setupUI(placeholder: "Town")
        return instance
    }()

    private lazy var addressItem: TextFormItemView = {
        let instance = TextFormItemView.fromNib()
        instance.setupUI(placeholder: "Password")
        return instance
    }()

    private lazy var phoneItem: TextFormItemView = {
        let instance = TextFormItemView.fromNib()
        instance.setupUI(placeholder: "Phone")
        return instance
    }()

    private lazy var saveButtonItem: ButtonFormItemView = {
        return ButtonFormItemView.fromNib()
    }()

    // MARK: - Initialization
    init(withView view: UIView) {
        self.parentView = view
        self.formView = FormView(frame: self.parentView.frame)
        self.errorStack = BASStack()
    }

    // MARK: - Methods
    func setupFormPage() {
        parentView.addSubview(self.formView)
        setFormItemUI()
        formView.add([usernameItem, surnameItem, passwordItem, birthdateItem, cityItem, townItem, addressItem, phoneItem, saveButtonItem])
    }

    func validate() {
        errorStack.removeAll()
        formView.validate()
    }
}

// MARK: - Private Methods
private extension FormManager {
    func setFormItemUI() {
        setUsernameItem()
        setSurnameItem()
        setCityItem()
        setBirthdateItem()
        setSaveButtonItem()
    }

    func setUsernameItem() {
        usernameItem.onValidation = { [weak self]  in
            guard let strongSelf = self else { return false }
            guard let value = strongSelf.usernameItem.value as? String else { return false }
            let isValid = FormValidator.isValidUsername(value: value)
            if !isValid {
                strongSelf.errorStack.push("Username is not valid")
            }
            return isValid
        }
    }

    func setSurnameItem() {
        surnameItem.onValidation = { [weak self]  in
            guard let strongSelf = self else { return false }
            guard let value = strongSelf.surnameItem.value as? String else { return false }
            let isValid = FormValidator.isValidUsername(value: value)
            if !isValid {
                strongSelf.errorStack.push("Surname is not valid")
            }
            return isValid
        }
    }

    func setCityItem() {
        cityItem.didChange = { value in
            guard let city = value as? String else { return }
            Logger.debug("City change: \(city)")
        }
    }

    func setBirthdateItem() {
        birthdateItem.didChange = { value in
            guard let date = value as? String else { return }
            Logger.debug("Date change: \(date)")
        }
    }

    func setSaveButtonItem() {
        saveButtonItem.onClick = {[weak self] in
            guard let strongSelf = self else { return }
            strongSelf.parentView.endEditing(true)
            strongSelf.validate()
            strongSelf.delegate?.onDone(errorStack: strongSelf.errorStack)
        }
    }

}
