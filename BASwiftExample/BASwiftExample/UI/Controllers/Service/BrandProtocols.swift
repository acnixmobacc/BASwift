//
//  BrandProtocols.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 31.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

// MARK: - View Protocols
protocol BrandViewProtocol: BrandViewDelegate {}

protocol BrandViewDelegate: BABaseViewDelegate {
    func onGetBrandsSuccess()

    func onGetBrandsFail()
}

// MARK: - ViewModel Protocols
protocol BrandViewModelProtocol: BrandViewModelDelegate {

    var viewDelegate: BrandViewDelegate? { get set }

    func onDidLoad()
}

protocol BrandViewModelDelegate: class {
    func onGetBrandsSuccess()

    func onGetBrandsFail()
}

// MARK: - Model Protocols
protocol BrandModelProtocol: class {
    var viewModelDelegate: BrandViewModelDelegate? { get set }

    func getBrands()
}
