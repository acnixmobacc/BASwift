//
//  PolicyServiceAdapter.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

public class CarServiceAdapter: ServiceAdapter, ICarServiceAdapter {

    enum Endpoint: String {
        case brand = "/brand"
    }

    public func getBrands(onSuccess:@escaping (BrandList) -> Void, onError:@escaping (Error?) -> Void) {
        let request: Request = Request(endpoint: Endpoint.brand.rawValue)

        service.execute(request: request, onResponse: {(response: Response<BrandList>) in
            guard let entity = response.entity else {
                onError(response.error)
                return
            }
            onSuccess(entity)
        })
    }
}
