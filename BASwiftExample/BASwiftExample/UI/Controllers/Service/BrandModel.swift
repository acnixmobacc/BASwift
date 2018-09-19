//
//  ServiceModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

class BrandModel: BaseModel {

    weak var viewModelDelegate: BrandViewModelDelegate?

    private(set) var carServiceAdapter: CarServiceAdapterProtocol

    override init() {
        carServiceAdapter = AppWebServiceProvider.instance.carServiceAdapter
        super.init()
    }

}

extension BrandModel: BrandModelProtocol {

    func getBrands() {
        carServiceAdapter.getBrands(onSuccess: { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.viewModelDelegate?.onGetBrandsSuccess()

        }, onFailure: { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.viewModelDelegate?.onGetBrandsFail()
        })
    }

}
