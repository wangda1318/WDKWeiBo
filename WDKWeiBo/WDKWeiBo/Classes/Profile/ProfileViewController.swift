//
//  ProfileViewController.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/3/17.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class ProfileViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView.setupVisitorView(iconName: "visitordiscover_image_profile", tip: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人")

        // Do any additional setup after loading the view.
    }

    
}
