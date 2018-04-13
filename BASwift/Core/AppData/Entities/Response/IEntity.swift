//
//  IServiceResponse.swift
//  BASwift
//
//  Created by Burak Akkaya on 4.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import SwiftyJSON

public protocol IEntity {
    init(withData data: JSON)
}
