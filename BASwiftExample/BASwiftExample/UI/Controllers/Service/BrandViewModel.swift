//
//  ServiceViewModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

class BrandViewModel: BaseViewModel {

    weak var viewDelegate: BrandViewDelegate?

    private(set) var model: BrandModelProtocol

    required init() {
        model = BrandModel()
        super.init()
        model.viewModelDelegate = self
    }

}

extension BrandViewModel: BrandViewModelProtocol {
    func onDidLoad() {
        model.getBrands()
    }

    func onGetBrandsSuccess() {
        viewDelegate?.onGetBrandsSuccess()
    }

    func onGetBrandsFail() {
        viewDelegate?.onGetBrandsFail()
    }
}
