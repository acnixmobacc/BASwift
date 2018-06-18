//  BaseExpandableTableViewAdapter.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 14/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

open class ExpandableTableViewAdapter: TableViewAdapter {

    // MARK: - Methods
    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        guard let section = tableDataModel.sections[indexPath.section] as? BaseExpandableSectionModel else {
            return
        }
        let row = section.cellModels[indexPath.row]

        if row.cellType == .expand {
            section.isExpand = !section.isExpand
            perform(section.isExpand, indexPath)
        }
    }

    public func perform(_ isExpand: Bool, _ indexPath: IndexPath) {
        guard let section = tableDataModel.sections[indexPath.section] as? BaseExpandableSectionModel else {
            fatalError("Section must be baseexpandablesection")
        }

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
