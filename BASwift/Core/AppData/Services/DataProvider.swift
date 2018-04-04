//
//  WebService.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Alamofire
import SwiftyJSON


public class DataProvider : IDataProvider{
    @discardableResult
    func loadList<T:IEntity>(request: ServiceResource, onSuccess: @escaping ([T]) -> Void,
                     onError: @escaping (Error?) -> Void) -> DataRequest
    {
        return Alamofire.request(request.url, method: request.method, parameters: request.param,
                                 encoding: request.encoding, headers: request.header).validate()
            .responseJSON(completionHandler: { response in
                switch response.result{
                case .success:
                    if let value = response.result.value{
                        let data = JSON(value)
                        let response = data.arrayValue.map{ json in
                            return T(withData: json)
                        }
                        onSuccess(response)
                    }
                case .failure:
                    onError(response.error)
                }
            })
    }
    
    
    @discardableResult
    func load<T:IEntity>(request : ServiceResource, onSuccess:@escaping (T)->Void,
                 onError:@escaping (Error?)->Void) ->  DataRequest{
        
        return Alamofire.request(request.url, method: request.method, parameters: request.param,
                                 encoding: request.encoding, headers: request.header).validate()
            .responseJSON(completionHandler: { response in
                switch response.result{
                case .success:
                    if let value = response.result.value{
                        let json = JSON(value)
                        onSuccess(T.init(withData: json))
                    }
                case .failure:
                    onError(response.error)
                }
            })
    }
}
