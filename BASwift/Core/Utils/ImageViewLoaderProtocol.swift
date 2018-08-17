//
//  ImageViewLoaderProtocol.swift
//  BASwift
//
//  Created by Burak Akkaya on 17.08.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import UIKit

// MARK: - Image View Loader
public protocol ImageViewLoader {
    func setImage(withURLString urlString: String, isShowIndicator: Bool)
    func setImage(withURLString urlString: String, placeholder: UIImage, isShowIndicator: Bool)
}
