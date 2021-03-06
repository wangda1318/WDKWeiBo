//
//  VisitorView.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/3/17.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    class func visitorView() -> VisitorView {
        
        return Bundle.main.loadNibNamed("VisitorView", owner: nil, options: nil)?.first as! VisitorView
        
    }
    
    // MARK: 属性
    @IBOutlet weak var rotationImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    // MARK: 方法
    func setupVisitorView(iconName: String, tip: String) {

        rotationImageView.isHidden = true
        iconImageView.image = UIImage(named: iconName)
        tipLabel.text = tip
        
    }
    
    func rotate() {
        
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.fromValue = 0
        animation.toValue = Double.pi * 2
        animation.duration = 6
        animation.repeatCount = MAXFLOAT
        animation.isRemovedOnCompletion = false
        
        rotationImageView.layer.add(animation, forKey: nil)
        
    }
}
