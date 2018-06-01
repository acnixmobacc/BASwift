//
//  FormViewModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 29.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//
import RxSwift

class FormViewModel: BaseViewModel {
    weak var view: FormViewProtocol?

    private(set) var model: FormModelProtocol

    var username = Variable<String>("")
    var surname = Variable<String>("")
    var password = Variable<String>("")
    var birthdate = Variable<String>("")
    var city = Variable<String>("")
    var town = Variable<String>("")
    var address = Variable<String>("")
    var phone = Variable<String>("")

    required init() {
        model = FormModel()
        super.init()
        model.viewModel = self
    }

}

extension FormViewModel: FormViewModelProtocol {

    func getTown(forCity city: String) -> [String] {
        return model.getTown(forCity: city)
    }

    func getCities() -> [String] {
        return model.getCities()
    }

    func onClickSave() {
        print("Click")
    }

}
