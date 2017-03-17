//
//  MainTabBarController.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/3/17.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewController(childVC: HomeViewController(), imageName: "tabbar_home", title: "首页")
        addChildViewController(childVC: HomeViewController(), imageName: "tabbar_discover", title: "发现")
        addChildViewController(childVC: HomeViewController(), imageName: "tabbar_message_center", title: "消息")
        addChildViewController(childVC: HomeViewController(), imageName: "tabbar_profile", title: "我")

    }

    private func addChildViewController(childVC: UIViewController, imageName: String, title: String) {
        
        childVC.tabBarItem.image = UIImage(named: imageName)
        childVC.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        childVC.title = title
        
        let navigationVC = UINavigationController(rootViewController: childVC)
        addChildViewController(navigationVC)

    }
}

