//
//  BaseExpandableSection.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 14/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public class BaseExpandableSectionModel: BaseSectionModel {

    // MARK: - Private Properties
    private var _isExpand: Bool!

    // MARK: - Properties
    public var expandedCellModels: [BaseCellModel]

    public var collapsedCellModels: [BaseCellModel]

    public var isExpand: Bool {
        get {
            return _isExpand
        }

        set(value) {
            cellModels = value ? expandedCellModels : collapsedCellModels
            _isExpand = value

        }
    }

    // MARK: - Initialization
    public init(cellModels: [BaseCellModel] = [], headerHeight: CGFloat = 0,
                landscapeHeaderHeight: CGFloat! = nil, footerHeight: CGFloat = 0,
                landscapeFooterHeight: CGFloat! = nil, sectionText: String! = nil,
                backgroundColor: UIColor = UIColor.white, expandedCellModels: [BaseCellModel],
                isExpand: Bool = false) {

        self.expandedCellModels = expandedCellModels
        self.collapsedCellModels = cellModels
        super.init(cellModels: cellModels, headerHeight: headerHeight,
                   landscapeHeaderHeight: landscapeHeaderHeight, footerHeight: footerHeight,
                   landscapeFooterHeight: landscapeFooterHeight, sectionText: sectionText)
        self.isExpand = isExpand
    }
}
