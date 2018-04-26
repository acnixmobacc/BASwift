//
//  FormViewController.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 29.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift
import RxSwift
import RxCocoa

class FormViewController: BABaseViewController<FormViewModel>, UITextFieldDelegate {
    
    //MARK: - UI Properties
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var cityField: PickerTextField!
    @IBOutlet weak var townField: PickerTextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var birthdateField: DatePickerTextField!
    @IBOutlet weak var saveButton: UIButton!
    
    //MARK: - Properties
    weak var coordinatorDelegate : LoginCoordinatorDelegate?
    
    var keyboardManager : KeyboardManager!
    
    var textFieldList : [UITextField]!
    
    var disposeBag : DisposeBag = DisposeBag()
    
    
    //MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        textFieldList = [nameField, surnameField, passwordField, birthdateField, cityField, townField,
                         addressField, phoneField]
        
        keyboardManager = KeyboardManager(withScrollView: scrollView)
        
        setBinding()
        setPickers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        keyboardManager.startObservingKeyboard()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        keyboardManager.stopObservingKeyboard()
    }

    //MARK: - Private Methods
    private func setBinding(){
        nameField.rx.text.orEmpty.bind(to: viewModel.username).disposed(by: disposeBag)
        surnameField.rx.text.orEmpty.bind(to: viewModel.surname).disposed(by: disposeBag)
        passwordField.rx.text.orEmpty.bind(to: viewModel.password).disposed(by: disposeBag)
        cityField.rx.text.orEmpty.bind(to: viewModel.city).disposed(by: disposeBag)
        townField.rx.text.orEmpty.bind(to: viewModel.town).disposed(by: disposeBag)
        addressField.rx.text.orEmpty.bind(to: viewModel.address).disposed(by: disposeBag)
        phoneField.rx.text.orEmpty.bind(to: viewModel.phone).disposed(by: disposeBag)
        birthdateField.rx.text.orEmpty.bind(to: viewModel.birthdate).disposed(by: disposeBag)
        
        saveButton.rx.tap.bind(onNext : { [weak self] in
            self?.viewModel.onClickSave()
        }).disposed(by: disposeBag)
    }
    
    private func setPickers(){
        birthdateField.setDatePickerView(withPicker: DatePicker.init())
        cityField.setPickerView(withData: viewModel.getCities())
        townField.setPickerView(withData: [])
    }
    
    //MARK: - Text Field Delegation Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let index = textFieldList.index(of: textField){
            if textFieldList.count > index + 1{
                textFieldList[index + 1].becomeFirstResponder()
            }else{
                textField.resignFirstResponder()
            }
        }else{
            textField.resignFirstResponder()
        }
        
        return true
    }
    
}

