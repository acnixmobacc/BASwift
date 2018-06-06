//
//  BaseSection.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 09/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

open class BaseSectionModel: NSObject {
    // MARK: - Private Properties
    private var _headerHeight: CGFloat
    private var _landscapeHeaderHeight: CGFloat!
    private var _footerHeight: CGFloat
    private var _landscapeFooterHeight: CGFloat!

    // MARK: - Properties
    public var cellModels: [BaseCellModel]
    public var sectionText: String!

    public var landscapeHeaderHeight: CGFloat {
        if let landscapeHeight = _landscapeHeaderHeight {
            return landscapeHeight
        } else {
            return _headerHeight
        }
    }

    public var headerHeight: CGFloat {
        if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation)) {
            return landscapeHeaderHeight
        } else {
            return _headerHeight
        }
    }

    public var landscapeFooterHeight: CGFloat {
        if let landscapeHeight = _landscapeFooterHeight {
            return landscapeHeight
        } else {
            return _footerHeight
        }
    }

    public var footerHeight: CGFloat {
        if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation)) {
            return landscapeFooterHeight
        } else {
            return _footerHeight
        }
    }

    // MARK: - Initialization
    public init(cellModels: [BaseCellModel] = [], headerHeight: CGFloat = 0,
                landscapeHeaderHeight: CGFloat! = nil, footerHeight: CGFloat = 0,
                landscapeFooterHeight: CGFloat! = nil, sectionText: String! = nil) {
        self.cellModels = cellModels
        _headerHeight = headerHeight
        _landscapeHeaderHeight = landscapeHeaderHeight
        _landscapeFooterHeight = landscapeFooterHeight
        _footerHeight = footerHeight
        self.sectionText = sectionText
    }

    // MARK: - Methods
    open func headerView() -> UIView {

        let view = UIView()
        view.backgroundColor = UIColor.clear

        return view
    }

    open func footerView() -> UIView {

        let view = UIView()
        view.backgroundColor = UIColor.clear

        return view
    }
}
