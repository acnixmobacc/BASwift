//
//  UICustomSection.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 26.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class UICustomSection : BaseSectionModel{
    override func headerView() -> UIView {
        let view = UIView()
        view.backgroundColor = .blue
        
        return view
    }
}


