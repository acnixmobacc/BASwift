//
//  BaseCollectionData.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 09/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

open class BaseCollectionDataModel: NSObject {
    public var sections: [BaseCollectionSectionModel] = []

    public init(_ sections: [BaseCollectionSectionModel] = []) {
        self.sections = sections
    }
}
