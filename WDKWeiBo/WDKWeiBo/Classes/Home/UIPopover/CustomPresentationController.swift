//
//  CustomPresentationController.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/19.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class CustomPresentationController: UIPresentationController {

    var coverView: UIView = UIView()
    
    override func containerViewDidLayoutSubviews() {
        
        presentedView?.frame = CGRect(x: 100, y: 55, width: 180, height: 250)
        
        setupCoverView()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CustomPresentationController.tapClick))
        coverView.addGestureRecognizer(tap)
        
    }
}

private extension CustomPresentationController {
    
    func setupCoverView() {
        
        containerView!.insertSubview(coverView, at: 0)
        coverView.backgroundColor = UIColor(white: 0.2, alpha: 0.2)
        coverView.frame = containerView!.bounds
        
    }
}

private extension CustomPresentationController {
    
    @objc func tapClick() {
        
        presentedViewController.dismiss(animated: true, completion: nil)
        
    }
}
