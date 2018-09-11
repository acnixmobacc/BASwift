//
//  UITableView+BASwift.swift
//  BASwift
//
//  Created by Burak Akkaya on 18.06.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public extension UITableView {

    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.className, for: indexPath) as? T else {
            fatalError("Cannot dequeue cell with identifier \(T.className)")
        }

        return cell
    }
}
