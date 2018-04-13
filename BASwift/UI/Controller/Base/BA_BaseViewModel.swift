//
//  BaseViewModel.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

open class BA_BaseViewModel: BA_BaseViewModelProtocol {

    //MARK: - Properties
    weak public var baseViewDelegate: BA_BaseViewProtocol?

    //MARK: - Initialization
    required public init() {

    }

    //MARK: - Methods
    open func initWithData(data: [Any?]) {

    }

    //MARK: - View Model Lifecycle
    open func onDidLoad() {

    }

    open func onWillAppear() {

    }

    open func onDidAppear() {

    }

    open func onWillDisappear() {

    }

    open func onDidDisappear() {

    }

    open func onWillLayoutSubviews() {

    }

    open func onDidLayoutSubviews() {

    }

    //MARK: - Completion
    open func onBackCompletion(_ data: [Any?]?) {

    }

}
