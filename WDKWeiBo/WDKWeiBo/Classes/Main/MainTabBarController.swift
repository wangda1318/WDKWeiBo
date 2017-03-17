//
//  MainTabBarController.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/3/17.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    lazy var composeButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupComposeButton()
        
    }
    
    
}


private extension MainTabBarController {
    
    func setupComposeButton() {
        
        tabBar.addSubview(composeButton)
        
        composeButton.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: .normal)
        composeButton.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: .highlighted)
        composeButton.setImage(UIImage(named: "tabbar_compose_icon_add"), for: .normal)
        composeButton.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: .normal)

        composeButton.sizeToFit()
        
        composeButton.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height / 2.0)
        
    }
}
