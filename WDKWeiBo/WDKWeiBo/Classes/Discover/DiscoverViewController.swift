//
//  DiscoverViewController.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/3/17.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView.setupVisitorView(iconName: "visitordiscover_image_message", tip: "登录后，别人评论你的微博，给你发消息，都会在这里收到通知")
        
    }

    
}
