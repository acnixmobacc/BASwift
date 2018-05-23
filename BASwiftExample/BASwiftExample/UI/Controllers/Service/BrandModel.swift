//
//  ServiceModel.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

protocol BrandModelDelegate: class {
    func onGetBrandsSuccess()
    func onGetBrandsFail()
}

class BrandModel {

    private(set) var carServiceAdapter: CarServiceAdapterProtocol

    weak var delegate: BrandModelDelegate?

    init() {
        carServiceAdapter = AppWebServiceProvider.instance.carServiceAdapter
    }

    func getBrands() {
        carServiceAdapter.getBrands(onSuccess: { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.onGetBrandsSuccess()
        }, onError: { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.onGetBrandsFail()
        })
    }
}
