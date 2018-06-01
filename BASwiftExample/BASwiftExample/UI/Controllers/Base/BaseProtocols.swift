//
//  BaseProtocols.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 31.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

protocol BaseViewModelProtocol: BABaseViewModelProtocol {
    func onDidLoad()

    func onWillAppear()

    func onDidAppear()

    func onWillDisappear()

    func onDidDisappear()

    func onWillLayoutSubviews()

    func onDidLayoutSubviews()
}

protocol BaseModelProtocol: BABaseModelProtocol {

}
