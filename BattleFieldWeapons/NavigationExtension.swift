//
//  NavigationExtension.swift
//  HelloWorld
//
//  Created by 黄小白 on 2019/1/5.
//  Copyright © 2019 Sherley Huang's studio. All rights reserved.
//

import UIKit

extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
