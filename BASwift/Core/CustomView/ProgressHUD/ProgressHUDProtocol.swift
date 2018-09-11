//
//  IProgressHUD.swift
//  BASwift
//
//  Created by Burak Akkaya on 22.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol ProgressHUDProtocol {

    var options: ProgressHUDOptions { get set }

    var isLoading: Bool { get }

    init(withOptions options: ProgressHUDOptions)

    func show(in view: UIView)

    func hide()

}
