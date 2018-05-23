//
//  CampaignServiceAdapter.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

public class UserServiceAdapter: ServiceAdapter, UserServiceAdapterProtocol {

    enum Endpoint: String {
        case user = "/user.json"
    }

    public func getUser(onSuccess : @escaping (User) -> Void, onFailure: @escaping (Error?) -> Void) {
        let request = Request(endpoint: Endpoint.user.rawValue)

        service.execute(request: request, onResponse: {(response: Response<User>) in
            guard let entity = response.entity else {
                onFailure(response.error)
                return
            }

            onSuccess(entity)
        })
    }

}
