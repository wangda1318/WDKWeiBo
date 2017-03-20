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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    override func loadView() {
        
        isLogin ? super.loadView() : setupVisitorView()

    }
    
}

private extension BaseTableViewController {
    
    func setupVisitorView() {
        
        let visitorView = VisitorView.VisitorView()
        visitorView.backgroundColor = UIColor(red: 238/255.0, green: 238/255.0, blue: 238/255.0, alpha: 1.0)
        view = visitorView
        
    }
}
