//
//  UIDetailItem.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 26.03.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import BASwift

class UIDetailItem : ICellData{
    var title : String
    var description : String
    
    init(_ title:String = "", _ description:String = "") {
        self.title = title
        self.description = description
    }
}
