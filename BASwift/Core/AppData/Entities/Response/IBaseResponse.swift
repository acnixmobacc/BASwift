//
//  IBaseResponse.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//
import SwiftyJSON

public protocol IBaseResponse {
    init(_ json: JSON)
}
