//
//  TabbarViewController.swift
//  GS25_WITHSOPT
//
//  Created by 조경진 on 2019/11/18.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    
  @IBInspectable var defaultIndex: Int = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = defaultIndex
    }
    
}
