//
//  DetailTableAdapter.swift
//  BASwift
//
//  Created by Burak Akkaya on 26.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

class UIDetailItem : ICellData{
    var title : String
    var description : String

    init(_ title:String = "", _ description:String = "") {
        self.title = title
        self.description = description
    }
}

class UIItem : ICellData{
    var value:  String
    
    init(_ value:String = "") {
        self.value = value
    }
}

class UICustomSection : BaseSectionModel{
    override func headerView() -> UIView {
        let view = UIView()
        view.backgroundColor = .blue
        
        return view
    }
}


class DetailTableAdapter : TableViewAdapter<[ICellData]>{

    override func registerNibs() {
        ItemTableViewCell.registerSelf(tableView)
        DetailItemTableViewCell.registerSelf(tableView)
    }
    
    override func setTableData() {
        guard let data = data else{
            tableDataModel = BaseTableDataModel()
            return
        }
        
        let detailCellModels : [ICellData] = data.filter{$0 is UIDetailItem}
        let itemCellModels : [ICellData] = data.filter{$0 is UIItem}
        
        tableDataModel.sections.append(getDetailSection(items: detailCellModels))
        tableDataModel.sections.append(getItemSection(items: itemCellModels))
    }
    
    func getDetailSection(items: [ICellData]) -> UICustomSection{
        let section : UICustomSection = UICustomSection(headerHeight:44)
        for item in items{
            section.cellModels.append(getDetailCell(item: item))
        }
        return section
    }
    
    func getItemSection(items: [ICellData]) -> BaseSectionModel{
        let section : BaseSectionModel = BaseSectionModel()
        for item in items{
            section.cellModels.append(getItemCell(item: item))
        }
        return section
    }
    
    func getItemCell(item: ICellData) -> BaseCellModel{
        return BaseCellModel(ItemTableViewCell.self, data: item)
    }
    
    func getDetailCell(item: ICellData) -> BaseCellModel{
        return BaseCellModel(DetailItemTableViewCell.self, data: item)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = getCellDataModel(indexPath)
        
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
                     withData data: ICellData?) -> ItemTableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.className,
                                                       for: indexPath) as? ItemTableViewCell else {
                fatalError("Cannot dequeue cell with identifier \(ItemTableViewCell.className)")
        }
        
        return cell
    }
    
    func cellForDetailItem(_ tableView: UITableView, cellForRowAt indexPath: IndexPath,
                     withData data: ICellData?) -> DetailItemTableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailItemTableViewCell.className,
                                                       for: indexPath) as? DetailItemTableViewCell else {
                fatalError("Cannot dequeue cell with identifier \(DetailItemTableViewCell.className)")
        }
        
        return cell
    }
}
