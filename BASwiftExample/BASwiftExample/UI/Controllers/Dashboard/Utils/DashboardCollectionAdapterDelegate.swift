//
//  DashboardCollectionAdapterDelegate.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 28.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

protocol DashboardCollectionAdapterDelegate : class{
    func onSelectItem(_ item:UIDashboardItem)
}
