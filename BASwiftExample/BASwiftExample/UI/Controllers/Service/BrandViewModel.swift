//
//  ServiceViewModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

class BrandViewModel: BaseViewModel {

    var model: BrandModel

    required init() {
        model = BrandModel()
        super.init()
        model.delegate = self
    }

    override func onDidLoad() {
        super.onDidLoad()
        model.getBrands()
    }
}

extension BrandViewModel: BrandModelDelegate {
    func onGetBrandsSuccess() {

    }

    func onGetBrandsFail() {

    }
}
