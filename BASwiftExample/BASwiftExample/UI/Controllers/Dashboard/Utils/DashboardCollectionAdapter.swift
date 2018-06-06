//
//  DashboardCollectionAdapter.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class DashboardCollectionAdapter: CollectionViewAdapter<[UIDashboardItem]> {

    fileprivate let cellWidth: CGFloat = Device.Screen.size.width / 2 - 15
    fileprivate let cellHeight: CGFloat = 167

    weak var delegate: DashboardCollectionAdapterDelegate?

    override func registerNibs() {
        DashboardItemCollectionViewCell.registerSelf(collectionView)
    }

    override func setCollectionData() {

        guard let data = data else {
            collectionData = BaseCollectionDataModel()
            return
        }

        var rows: [BaseCollectionCellModel] = []

        for item in data {
            rows.append(BaseCollectionCellModel(data: item, cellHeight: cellHeight, cellWidth: cellWidth,
                                                type: DashboardItemCollectionViewCell.self))
        }

        collectionData = BaseCollectionDataModel([BaseCollectionSectionModel(cellModels: rows)])
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellModel = getCellModel(indexPath)

        switch cellModel.type {
        case is DashboardItemCollectionViewCell.Type:
            return cellForDashboardItem(collectionView, cellForItemAt: indexPath, data: cellModel.cellData)
        default:
            return super.collectionView(collectionView, cellForItemAt: indexPath)
        }
    }

    private func cellForDashboardItem(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath,
                                      data: ICellData) -> DashboardItemCollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardItemCollectionViewCell.className,
                                                            for: indexPath) as? DashboardItemCollectionViewCell else {
            return DashboardItemCollectionViewCell()
        }

        guard let data = data as? UIDashboardItem else {
            fatalError("Data type is invalid")
        }

        cell.setView(withData: data)

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                                 insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        super.collectionView(collectionView, didSelectItemAt: indexPath)

        guard let data = getData(atIndexPath: indexPath) as? UIDashboardItem else {
            fatalError("Data type is invalid")
        }

        delegate?.onSelectItem(data)

    }
}
