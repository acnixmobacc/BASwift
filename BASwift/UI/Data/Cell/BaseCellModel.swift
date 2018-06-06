//
//  BaseCellModel.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 09/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public enum IXCellType {
    case expand
    case `default`
}

open class BaseCellModel: NSObject {
    // MARK: - Private Properties
    private var _landscapeCellHeight: CGFloat!
    private var _cellHeight: CGFloat

    // MARK: - Properties
    public var cellData: ICellData!
    public var type: AnyClass
    public var cellType: IXCellType

    public var landscapeCellHeight: CGFloat {
        if let landscapeHeight = _landscapeCellHeight {
            return landscapeHeight
        } else {
            return _cellHeight
        }
    }

    public var cellHeight: CGFloat {
        if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation)) {
            return landscapeCellHeight
        } else {
            return _cellHeight
        }
    }

    // MARK: - Initialization
    public init(_ type: AnyClass, data: ICellData! = nil, cellHeight: CGFloat = 44,
                landscapeCellHeight: CGFloat! = nil, cellType: IXCellType = .default) {
        _cellHeight = cellHeight
        _landscapeCellHeight = landscapeCellHeight
        self.cellData = data
        self.type = type
        self.cellType = cellType
    }
}
