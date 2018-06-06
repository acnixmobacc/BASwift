//
//  SampleCollectionViewAdapter.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 26.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class SampleCollectionViewAdapter: CollectionViewAdapter<[UISampleItem]> {

    override func registerNibs() {
        SampleItemCollectionViewCell.registerSelf(collectionView)
    }

    override func setCollectionData() {
        var rows: [BaseCollectionCellModel] = []

        guard let data = data else {
            collectionData = BaseCollectionDataModel()
            return
        }

        for item in data {
            rows.append(BaseCollectionCellModel(data: item, type: SampleItemCollectionViewCell.self))
        }

        collectionData = BaseCollectionDataModel([BaseCollectionSectionModel(cellModels: rows)])
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellModel = getCellModel(indexPath)

        switch cellModel.type {
        case is SampleItemCollectionViewCell.Type:
            return cellForSampleItem(collectionView, cellForItemAt: indexPath, data: cellModel.cellData)
        default:
            return super.collectionView(collectionView, cellForItemAt: indexPath)
        }
    }

    func cellForSampleItem(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, data: ICellData) -> SampleItemCollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SampleItemCollectionViewCell.className,
                                                            for: indexPath) as? SampleItemCollectionViewCell
            else {
                fatalError("Cannot dequeue cell with identifier \(SampleItemCollectionViewCell.className)")
        }

        return cell

    }
}
