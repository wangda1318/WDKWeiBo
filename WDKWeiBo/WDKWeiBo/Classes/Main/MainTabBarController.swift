//
//  MainTabBarController.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/3/17.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    // MARK: 懒加载
    lazy var composeButton: UIButton = UIButton(imageName: "tabbar_compose_button", backgroundImageName: "tabbar_compose_icon_add")
    
    // MARK: 系统方法
    override func viewDidLoad() {
        super.viewDidLoad()

        setupComposeButton()
        
    }
    
    
}


// MARK: 自定义方法
private extension MainTabBarController {
    
    func setupComposeButton() {
        
        tabBar.addSubview(composeButton)
        
        composeButton.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height / 2.0)
        
        composeButton.addTarget(self, action: #selector(MainTabBarController.composeButtonClick), for: .touchUpInside)
        
    }
}

private extension MainTabBarController {
    
    @objc func composeButtonClick() {
        
        let composeVC = ComposeViewController()
        
        let composeNavigationVC = UINavigationController(rootViewController: composeVC)
        
        present(composeNavigationVC, animated: true, completion: nil)
    }
}
