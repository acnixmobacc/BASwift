//
//  BaseCollectionCell.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 09/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

open class BaseCollectionCellModel: BaseCellModel {

    //MARK: - Private Properties
    private var _cellWidth: CGFloat
    private var _landscapeCellWidth: CGFloat!

    //MARK: - Properties
    var landscapeCellWidth: CGFloat {
        if let landscapeWidth = _landscapeCellWidth {
            return landscapeWidth
        } else {
            return _cellWidth
        }
    }

    var cellWidth: CGFloat {
        if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation)) {
            return landscapeCellWidth
        } else {
            return _cellWidth
        }
    }

    //MARK: - Initialization
    public init(data: ICellData! = nil, cellHeight: CGFloat = 44, landscapeCellHeight: CGFloat! = nil,
                cellWidth: CGFloat = 44, landscapeCellWidth: CGFloat! = nil, type: AnyClass) {
        _cellWidth = cellWidth
        _landscapeCellWidth = landscapeCellWidth
        super.init(type, data: data, cellHeight: cellHeight, landscapeCellHeight: landscapeCellHeight)
    }
}
