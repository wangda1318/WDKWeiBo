//
//  UIBarButtonItem+Extension.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/3/20.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    /*
    convenience init(imageName: String) {
        self.init()
        
        let button = UIButton()
        button.setImage(UIImage(named: imageName), for: .normal)
        button.setImage(UIImage(named: imageName + ""), for: .highlighted)
        
        self.customView = button
        
    }
    */
    convenience init(imageName: String) {
        
        let button = UIButton()
        button.setImage(UIImage(named: imageName), for: .normal)
        button.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        button.sizeToFit()
        
        self.init(customView: button)
        
    }

}
