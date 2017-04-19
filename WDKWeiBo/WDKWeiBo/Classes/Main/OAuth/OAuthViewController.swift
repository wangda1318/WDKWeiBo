//
//  OAuthViewController.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/19.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class OAuthViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationItems()
        
        webView.loadRequest(URLRequest(url: URL(string: "https://www.baidu.com")!))
        
        // Do any additional setup after loading the view.
    }


}


private extension OAuthViewController {
    
    func setupNavigationItems() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .plain, target: self, action: "closeItem")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "填充", style: .plain, target: self, action: "fillItem")
        title = "授权页面"
        
    }
    
}

private extension OAuthViewController {
    
    @objc func closeItem() {
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func fillItem() {
        
        dismiss(animated: true, completion: nil)

    }
}
