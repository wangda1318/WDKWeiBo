//
//  MainTabBarController.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/3/17.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    lazy var composeButton: UIButton = UIButton(imageName: "tabbar_compose_button", backgroundImageName: "tabbar_compose_icon_add")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupComposeButton()
        
    }
    
    
}


private extension MainTabBarController {
    
    func setupComposeButton() {
        
        tabBar.addSubview(composeButton)
        
        composeButton.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height / 2.0)
        
    }
}
