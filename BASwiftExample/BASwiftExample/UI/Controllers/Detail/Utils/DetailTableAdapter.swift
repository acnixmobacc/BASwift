//
//  DetailTableAdapter.swift
//  BASwift
//
//  Created by Burak Akkaya on 26.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

protocol DetailTableAdapterDelegate: class {
    func onSelectItem()
}

class DetailTableAdapter: TableViewAdapter {

    weak var delegate: DetailTableAdapterDelegate?

    var data: [Any]?

    init(_ tableView: UITableView, _ data: [Any]) {
        self.data = data
        super.init(tableView)
    }

    override func registerNibs() {
        ItemTableViewCell.registerSelf(tableView)
        DetailItemTableViewCell.registerSelf(tableView)
    }

    override func setTableData() {
        guard let data = data else {
            tableDataModel = BaseTableDataModel()
            return
        }

        let detailCellModels: [Any] = data.filter { $0 is UIDetailItem }
        let itemCellModels: [Any] = data.filter { $0 is UIItem }

        tableDataModel.sections.append(getDetailSection(items: detailCellModels))
        tableDataModel.sections.append(getItemSection(items: itemCellModels))
    }

    func getDetailSection(items: [Any]) -> UICustomSection {
        let section: UICustomSection = UICustomSection(headerHeight: 44)
        for item in items {
            section.cellModels.append(getDetailCell(item: item))
        }
        return section
    }

    func getItemSection(items: [Any]) -> BaseSectionModel {
        let section: BaseSectionModel = BaseSectionModel()
        for item in items {
            section.cellModels.append(getItemCell(item: item))
        }
        return section
    }

    func getItemCell(item: Any) -> BaseCellModel {
        return BaseCellModel(ItemTableViewCell.self, data: item)
    }

    func getDetailCell(item: Any) -> BaseCellModel {
        return BaseCellModel(DetailItemTableViewCell.self, data: item)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = getCellModel(indexPath)

        switch cell.type {
        case is ItemTableViewCell.Type:
            return cellForItem(tableView, cellForRowAt: indexPath, withData: cell.cellData)
        case is DetailItemTableViewCell.Type:
            return cellForDetailItem(tableView, cellForRowAt: indexPath, withData: cell.cellData)
        default:
            return super.tableView(tableView, cellForRowAt: indexPath)
        }
    }

    func cellForItem(_ tableView: UITableView, cellForRowAt indexPath: IndexPath,
                     withData data: Any?) -> ItemTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.className,
                                                       for: indexPath) as? ItemTableViewCell else {
                fatalError("Cannot dequeue cell with identifier \(ItemTableViewCell.className)")
        }

        return cell
    }

    func cellForDetailItem(_ tableView: UITableView, cellForRowAt indexPath: IndexPath,
                           withData data: Any?) -> DetailItemTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailItemTableViewCell.className,
                                                       for: indexPath) as? DetailItemTableViewCell else {
                fatalError("Cannot dequeue cell with identifier \(DetailItemTableViewCell.className)")
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        delegate?.onSelectItem()
    }
}
