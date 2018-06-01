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

    var view: BrandViewProtocol? { get set }

    func onDidLoad()

    func onGetBrandsSuccess()

    func onGetBrandsFail()
}

protocol BrandModelProtocol: class {
    var viewModel: BrandViewModelProtocol? { get set }

    func getBrands()
}
