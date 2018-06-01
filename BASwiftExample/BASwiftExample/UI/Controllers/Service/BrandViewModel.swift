//
//  ServiceViewModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

class BrandViewModel: BaseViewModel {

    var view: BrandViewProtocol?

    private(set) var model: BrandModelProtocol

    required init() {
        model = BrandModel()
        super.init()
        model.viewModel = self
    }

}

extension BrandViewModel: BrandViewModelProtocol {
    func onDidLoad() {
        model.getBrands()
    }

    func onGetBrandsSuccess() {
        view?.onGetBrandsSuccess()
    }

    func onGetBrandsFail() {
        view?.onGetBrandsFail()
    }
}
