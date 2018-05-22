//
//  ServiceProvider.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

public class ServiceProvider: IServiceProvider {
    private(set) var carServiceAdapter: CarServiceAdapter

    private(set) var campaignServiceAdapter: CampaignServiceAdapter

    private(set) var service: Service

    init() {
        self.service = Service(withConfig: ServiceConfig(baseURL: "https://64bd7ddd-bceb-474e-a485-06f861a349f3.mock.pstmn.io"))
        self.carServiceAdapter = CarServiceAdapter(withService: service)
        self.campaignServiceAdapter = CampaignServiceAdapter(withService: service)
    }

    public func getCarServiceAdapter() -> ICarServiceAdapter {
        return carServiceAdapter
    }

    public func getCampaignServiceAdapter() -> ICampaignServiceAdapter {
        return campaignServiceAdapter
    }
}
