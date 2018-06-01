//
//  FormProtocols.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 31.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import RxSwift

protocol FormViewProtocol: class {

}

protocol FormViewModelProtocol: class {

    var view: FormViewProtocol? { get set }

    var username: Variable<String> { get set }

    var surname: Variable<String> { get set }

    var password: Variable<String> { get set }

    var birthdate: Variable<String> { get set }

    var city: Variable<String> { get set }

    var town: Variable<String> { get set }

    var address: Variable<String> { get set }

    var phone: Variable<String> { get set }

    func onClickSave()

    func getCities() -> [String]

}
