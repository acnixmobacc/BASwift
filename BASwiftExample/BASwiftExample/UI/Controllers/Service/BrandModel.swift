//
//  ServiceModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

class BrandModel: BaseModel {

    var viewModel: BrandViewModelProtocol?

    private(set) var carServiceAdapter: CarServiceAdapterProtocol

    required init() {
        carServiceAdapter = AppWebServiceProvider.instance.carServiceAdapter
        super.init()
    }

}

extension BrandModel: BrandModelProtocol {

    func getBrands() {
        carServiceAdapter.getBrands(onSuccess: { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.viewModel?.onGetBrandsSuccess()
        }, onFailure: { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.viewModel?.onGetBrandsFail()
        })
    }

}
