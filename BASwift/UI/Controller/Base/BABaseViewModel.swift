//
//  BaseViewModel.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

open class BABaseViewModel: BABaseViewModelProtocol {
    // MARK: - Properties
    weak public var baseViewDelegate: BABaseViewProtocol?

    // MARK: - Initialization
    required public init() {

    }
}
