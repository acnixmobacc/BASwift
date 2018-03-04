//
//  BaseCollectionViewAdapter.swift
//  BaseTableViewAdapter
//
//  Created by Burak Akkaya on 03/05/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

open class CollectionViewAdapter<T: BA_BaseViewModelProtocol> : NSObject, UICollectionViewDataSource,
                                                UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    public var collectionData: BaseCollectionDataModel {
        didSet {
            collectionView.reloadData()
        }
    }
    public var collectionView: UICollectionView
    public var viewModel: T

    public init(_ collectionView: UICollectionView, viewModel: T) {

        self.collectionView = collectionView
        self.viewModel = viewModel
        collectionData = BaseCollectionDataModel()
        super.init()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self

        registerNibs()

    }

    open func registerNibs() {}

    open func setCollectionData() {}

    open func updateData(_ collectionData: BaseCollectionDataModel) {
        self.collectionData = collectionData
    }

    open func getCellData(_ indexPath: IndexPath) -> BaseCellModel {
        return collectionData.sections[indexPath.section].cellModels[indexPath.row]
    }

    open func getSectionData(atIndexPath indexPath: IndexPath) -> BaseCollectionSectionModel {
        return collectionData.sections[indexPath.section]
    }

    open func getModel(atIndexPath indexPath: IndexPath) -> ICellModel! {
        return collectionData.sections[indexPath.section].cellModels[indexPath.row].cellModel
    }

    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return collectionData.sections.count
    }

    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.sections[section].cellModels.count
    }

    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionData.sections[section].headerWidth,
                      height: collectionData.sections[section].headerHeight)
    }

    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                             referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionData.sections[section].footerWidth,
                      height: collectionData.sections[section].footerHeight)
    }

    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }

    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        guard let item = collectionData.sections[indexPath.section].cellModels[indexPath.row] as? BaseCollectionCellModel
            else {
                fatalError("Collection row data must be extend from BaseCollectionCellModel")
            }

        return CGSize(width: item.cellWidth, height: item.cellHeight )
    }

    open func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {
        return UICollectionReusableView()
    }

    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

    open func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }

}
