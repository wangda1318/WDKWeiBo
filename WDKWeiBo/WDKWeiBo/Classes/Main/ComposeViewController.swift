//
//  ComposeViewController.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/21.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
        
        // Do any additional setup after loading the view.
    }


}

private extension ComposeViewController {
    
    func setupNavigation() {
        
        title = "发微博"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .plain, target: self, action: #selector(ComposeViewController.close))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "发布", style: .plain, target: self, action: #selector(ComposeViewController.send))
        navigationItem.rightBarButtonItem?.isEnabled = false
        
    }
}

private extension ComposeViewController {
    
    @objc func close() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc func send() {
        
        
    }
}
