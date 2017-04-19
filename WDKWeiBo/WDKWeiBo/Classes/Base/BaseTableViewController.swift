//
//  BaseTableViewController.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/3/17.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    var isLogin = false
    public lazy var visitorView = VisitorView.visitorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(BaseTableViewController.registerClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(BaseTableViewController.loginClick))
        
    }

    override func loadView() {
        
        isLogin ? super.loadView() : setupVisitorView()

    }
    
}

private extension BaseTableViewController {
    
    func setupVisitorView() {
        
        visitorView.backgroundColor = UIColor(red: 238/255.0, green: 238/255.0, blue: 238/255.0, alpha: 1.0)
        view = visitorView
        
        visitorView.registerButton.addTarget(self, action: #selector(BaseTableViewController.registerClick), for: .touchUpInside)
        visitorView.loginButton.addTarget(self, action: #selector(BaseTableViewController.loginClick), for: .touchUpInside)

    }
    
}

private extension BaseTableViewController {
    
    @objc func registerClick() {
        
        print("注册")
        
    }
    
    @objc func loginClick() {
        
        print("登录")
        
        let oAuthVC = OAuthViewController()
        
        let oAuthNavigationVC = UINavigationController(rootViewController: oAuthVC)
        
        present(oAuthNavigationVC, animated: true, completion: nil)
        
    }
}
