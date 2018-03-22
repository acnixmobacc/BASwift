//
//  BaseViewModel.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

open class BA_BaseViewModel: BA_BaseViewModelProtocol {

    weak public var baseViewDelegate: BA_BaseViewProtocol?

    required public init() {

    }

    open func initWithData(data: [Any?]) {

    }

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

    open func onBackCompletion(_ data: [Any?]?) {

    }

}
