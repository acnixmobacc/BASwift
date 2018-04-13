//
//  BaseCellData.swift
//  CellData
//
//  Created by Burak Akkaya on 25/03/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

open class BaseTableDataModel<T: BaseSectionModel> : NSObject {
    //MARK: - Properties
    public var sections: [T] = []

    //MARK: - Initialization
    public init(_ sections: [T] = []) {
        self.sections = sections
    }
}
