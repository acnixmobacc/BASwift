//
//  Storyboarded.swift
//  BASwift
//
//  Created by Burak Akkaya on 28.08.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol Storyboarded {
    static var storyboardName: String { get }

    static func instantiate() -> Self

    static func instantiate(identifier: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        return instantiate(identifier: self.className)
    }

    static func instantiate(identifier: String) -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)

        guard let vc = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError("Storyboard cannot instantiated")
        }

        return vc
    }
}
