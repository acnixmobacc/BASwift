//
//  IProgressHUD.swift
//  BASwift
//
//  Created by Burak Akkaya on 22.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

public protocol IProgressHUD {

    var options: ProgressOptions { get set }

    var isLoading: Bool { get }

    init(withOptions options: ProgressOptions)

    func start(inView view: UIView)

    func stop()

}
