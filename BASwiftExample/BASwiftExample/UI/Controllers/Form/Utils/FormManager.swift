//
//  FormManager.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 7.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

protocol FormManagerDelegate: class {
    func onDone(error: ValidationResultProtocol?)
}

public class FormManager {

    // MARK: - Properties
    fileprivate var parentView: UIView

    weak var delegate: FormManagerDelegate?

    public var formView: FormView

    // MARK: - Form Items
    private lazy var usernameItem: TextFormItemView = {
        let instance = TextFormItemView.fromNib()
        instance.validationRules = [UsernameRule(), RequiredRule()]
        instance.setupUI(placeholder: "Name")
        return instance
    }()

    private lazy var surnameItem: TextFormItemView = {
        let instance = TextFormItemView.fromNib()
        instance.validationRules = [UsernameRule(), RequiredRule()]
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
        let instance = ButtonFormItemView.fromNib()
        instance.setupUI(title: "Save")
        return instance
    }()

    private lazy var addButtonItem: ButtonFormItemView = {
        let instance = ButtonFormItemView.fromNib()
        instance.setupUI(title: "Add Item", buttonColor: .blue)
        return instance
    }()

    private lazy var switchButtonItem: SwitchFormItemView = {
        let instance = SwitchFormItemView.fromNib()
        return instance
    }()

    // MARK: - Initialization
    init(withView view: UIView) {
        self.parentView = view
        self.formView = FormView(frame: self.parentView.frame)
    }

    // MARK: - Methods
    func setupFormPage() {
        parentView.addSubview(self.formView)
        setFormItemUI()
        formView.add([usernameItem, surnameItem, passwordItem, birthdateItem, cityItem, switchButtonItem, saveButtonItem])
        setSwitchButtonItem()
    }
}

// MARK: - Private Methods
private extension FormManager {
    func setFormItemUI() {
        setCityItem()
        setBirthdateItem()
        setSaveButtonItem()
    }

    func addExpandableItems() {
        formView.add(townItem, after: switchButtonItem)
        formView.add(addressItem, after: townItem)
        formView.add(phoneItem, after: addressItem)
    }

    func removeExpandableItems() {
        formView.remove(townItem)
        formView.remove(addressItem)
        formView.remove(phoneItem)
    }

    func setExpandableItems(status: Bool) {
        if status {
            addExpandableItems()
        } else {
            removeExpandableItems()
        }
    }

    func setSwitchButtonItem() {
        if let status = switchButtonItem.value as? Bool {
            setExpandableItems(status: status)
        }

        switchButtonItem.onChange = {[weak self] status in
            guard let strongSelf = self else { return }
            guard let status = status as? Bool else { return }
            strongSelf.setExpandableItems(status: status)
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
            strongSelf.delegate?.onDone(error: strongSelf.formView.validate())
        }
    }

}
