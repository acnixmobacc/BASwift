//
//  IDataProvider.swift
//  BASwift
//
//  Created by Burak Akkaya on 4.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Alamofire

public protocol IWebServiceFactory {
    init()

    func load<T: IEntity>(request: ServiceResource, onSuccess:@escaping (T) -> Void,
                          onError:@escaping (Error?) -> Void) -> DataRequest

    func loadList<T: IEntity>(request: ServiceResource, onSuccess:@escaping ([T]) -> Void,
                              onError:@escaping (Error?) -> Void) -> DataRequest
}
