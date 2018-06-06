//
//  BrandProtocols.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 31.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

protocol BrandViewProtocol: class {

    func onGetBrandsSuccess()

    func onGetBrandsFail()
}

protocol BrandViewModelProtocol: class {

    var viewDelegate: BrandViewProtocol? { get set }

    func onDidLoad()

    func onGetBrandsSuccess()

    func onGetBrandsFail()
}

protocol BrandModelProtocol: class {
    var viewModelDelegate: BrandViewModelProtocol? { get set }

    func getBrands()
}
