//
//  RequestInformation.swift
//  BASwift
//
//  Created by Burak Akkaya on 4.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Alamofire

public typealias JSONDictionary = [String : Any]?

public typealias HeaderDictionary = [String : String]?

public class ServiceResource{
    
    public var url:URL
    
    public var header : HeaderDictionary
    
    public var param : JSONDictionary
    
    public var method: HTTPMethod
    
    public var encoding : ParameterEncoding
    
    public init(withURL url:String, header:HeaderDictionary = nil, param:JSONDictionary = nil,
         method:HTTPMethod = .get, encoding:ParameterEncoding = URLEncoding.default ) {
        
        guard let url = URL(string: url) else{
            fatalError("URL not valid")
        }
        self.url = url
        self.header = header
        self.param = param
        self.method = method
        self.encoding = encoding
        
    }
    
    
    public init(withPostUrl url:String, header:HeaderDictionary = nil, param:JSONDictionary = nil,
         encoding:ParameterEncoding = URLEncoding.default)
    {
        guard let url = URL(string: url) else{
            fatalError("URL not valid")
        }
        
        self.url = url
        self.header = header
        self.param = param
        self.method = .post
        self.encoding = encoding
    }
    
}
