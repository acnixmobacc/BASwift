//
//  BaseCollectionViewAdapter.swift
//  BaseTableViewAdapter
//
//  Created by Burak Akkaya on 03/05/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

open class CollectionViewAdapter: NSObject, UICollectionViewDataSource,
                                                UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // MARK: - Properties
    public var collectionData: BaseCollectionDataModel {
        didSet {
            collectionView.reloadData()
        }
    }

    public var collectionView: UICollectionView

    // MARK: - Initialization
    public init(_ collectionView: UICollectionView) {

        self.collectionView = collectionView
        collectionData = BaseCollectionDataModel()
        super.init()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self

        registerNibs()
        setCollectionData()

    }

    // MARK: - Methods
    open func registerNibs() {}

    open func setCollectionData() {}

    open func getCellModel(_ indexPath: IndexPath) -> BaseCellModel {
        return collectionData.sections[indexPath.section].cellModels[indexPath.row]
    }

    open func getSectionModel(atIndexPath indexPath: IndexPath) -> BaseCollectionSectionModel {
        return collectionData.sections[indexPath.section]
    }

    open func getData<T>(atIndexPath indexPath: IndexPath) -> T? {
        guard let data = collectionData.sections[indexPath.section].cellModels[indexPath.row].cellData as? T else {
            return nil
        }

        return data
    }

    // MARK: - UICollectionView DataSource & Delegate
    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return collectionData.sections.count
    }

    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.sections[section].cellModels.count
    }

    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                             referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionData.sections[section].headerWidth,
                      height: collectionData.sections[section].headerHeight)
    }

    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                             referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionData.sections[section].footerWidth,
                      height: collectionData.sections[section].footerHeight)
    }

    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                             insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }

    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                             sizeForItemAt indexPath: IndexPath) -> CGSize {

        guard let item = collectionData.sections[indexPath.section].cellModels[indexPath.row] as? BaseCollectionCellModel
            else {
                fatalError("Collection row data must be extend from BaseCollectionCellModel")
            }

        return CGSize(width: item.cellWidth, height: item.cellHeight )
    }

    open func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                             at indexPath: IndexPath) -> UICollectionReusableView {
        return UICollectionReusableView()
    }

    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

    open func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }

}
