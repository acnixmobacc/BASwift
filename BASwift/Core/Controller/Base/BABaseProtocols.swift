//
//  BaseProtocols.swift
//  BASwift
//
//  Created by Burak Akkaya on 2.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

// MARK: - View Interface
public protocol BABaseViewProtocol: BABaseViewDelegate, ErrorDisplayable {}

public protocol BABaseViewDelegate: Loadable, AlertDisplayable { }

// MARK: - View Model Interface
public protocol BABaseViewModelProtocol: class {}

// MARK: - Model Interface
public protocol BABaseModelProtocol: class {}
