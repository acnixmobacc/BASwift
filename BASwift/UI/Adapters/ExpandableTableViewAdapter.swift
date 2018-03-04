//  BaseExpandableTableViewAdapter.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 14/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

open class ExpandableTableViewAdapter<T: BaseViewModelProtocol> : BaseTableViewAdapter<T, BaseExpandableSectionModel> {

    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        let section = tableDataModel.sections[indexPath.section]
        let row = section.cellModels[indexPath.row]

        if row.cellType == .expand {
            section.isExpand = !section.isExpand
            run(section.isExpand, indexPath)
        }
    }

    public func run(_ isExpand: Bool, _ indexPath: IndexPath) {
        let section: BaseExpandableSectionModel = tableDataModel.sections[indexPath.section]

        tableView.beginUpdates()

        let expandCellIndexPath = IndexPath(row: section.collapsedCellModels.count - 1,
                                            section: indexPath.section)

        tableView.reloadRows(at: [expandCellIndexPath], with: .fade)

        var indexPaths = [IndexPath]()

        for i in section.collapsedCellModels.count..<section.expandedCellModels.count {
            let indexPath = IndexPath(row: i, section: indexPath.section)
            indexPaths.append(indexPath)
        }

        isExpand ? tableView.insertRows(at: indexPaths, with: .fade) : tableView.deleteRows(at: indexPaths, with: .fade)

        tableView.endUpdates()
    }

}
