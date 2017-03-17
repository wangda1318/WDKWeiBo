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

//        addChildViewController(childVC: HomeViewController(), imageName: "tabbar_home", title: "首页")
//        addChildViewController(childVC: DiscoverViewController(), imageName: "tabbar_discover", title: "发现")
//        addChildViewController(childVC: MessageViewController(), imageName: "tabbar_message_center", title: "消息")
//        addChildViewController(childVC: ProfileViewController(), imageName: "tabbar_profile", title: "我")

//        addChildViewController(childControllerName: "HomeViewController", imageName: "tabbar_home", title: "首页")
//        addChildViewController(childControllerName: "DiscoverViewController", imageName: "tabbar_discover", title: "发现")
//        addChildViewController(childControllerName: "MessageViewController", imageName: "tabbar_message_center", title: "消息")
//        addChildViewController(childControllerName: "ProfileViewController", imageName: "tabbar_profile", title: "我")

        guard let jsonPath = Bundle.main.path(forResource: "MainVCSettings.json", ofType: nil) else {
            
            return
        }
        
        guard let data = try? NSData(contentsOfFile: jsonPath, options: NSData.ReadingOptions.alwaysMapped) else {
            
            return
        }
        
        guard let jsonArray = try? JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableLeaves) as? [[String: Any]] else {
            
            return
        }
        
        for dict in jsonArray! {
            
            guard let vcName = dict["vcName"] as? String else {
                continue
            }
            
            guard let imageName = dict["imageName"] as? String else {
                continue
            }

            guard let titleName = dict["title"] as? String else  {
                continue
            }

            addChildViewController(childControllerName: vcName, imageName: imageName, title: titleName)
        }
    }

    // 方法重载->1.参数名相同但是类型不同；2.参数相同但是数量不同
    private func addChildViewController(childVC: UIViewController, imageName: String, title: String) {
        
        childVC.tabBarItem.image = UIImage(named: imageName)
        childVC.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        childVC.title = title
        
        let navigationVC = UINavigationController(rootViewController: childVC)
        addChildViewController(navigationVC)

    }
    
    // 根据字符串创建类型
    private func addChildViewController(childControllerName: String, imageName: String, title: String) {
       
        // 此处获取类会加上命名空间：WDKWeiBo
        // 获取命名空间
        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            print("获取命名空间失败")
            return
        }
        
        guard let childClass = NSClassFromString(nameSpace + "." + childControllerName) else {
            
            print("获取类失败")
            return
            
        }
        
        print(childClass)
        
        // AnyClass -> UIViewController
        let childType = UIViewController.self
        
        let childVC = childType.init()
        childVC.view.backgroundColor = UIColor.white
        
        childVC.tabBarItem.image = UIImage(named: imageName)
        childVC.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        childVC.title = title
        
        let navigationVC = UINavigationController(rootViewController: childVC)
        addChildViewController(navigationVC)

    }
}

