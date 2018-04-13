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

class FormViewController: BA_BaseViewController<FormViewModel>, UITextFieldDelegate {
    
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
    
    var textFieldList : [UITextField]!
    
    var disposeBag : DisposeBag = DisposeBag()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)),
                                               name: Notification.Name.UIKeyboardDidShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)),
                                               name: Notification.Name.UIKeyboardDidHide, object: nil)
        
        textFieldList = [nameField, surnameField, passwordField, birthdateField, cityField, townField,
                         addressField, phoneField]
        
        setBinding()
        setPickers()
    }
    

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
    
    
    @objc
    func keyboardDidShow(_ notification:NSNotification){
        
        if let userInfo = notification.userInfo , let value = userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue{
            let keyboardFrame = value.cgRectValue
            var contentInset = scrollView.contentInset
            contentInset.bottom = keyboardFrame.size.height
            scrollView.contentInset = contentInset
        }
        
    }
    
    @objc
    func keyboardDidHide(_ notification:NSNotification){
        scrollView.contentInset = .zero
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textField.resignFirstResponder()
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

