//
//  UIButton+Extension.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/3/17.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

extension UIButton {
    
    // 自定义构造函数
    convenience init(imageName: String, backgroundImageName: String) {
        
        self.init()
        
        setBackgroundImage(UIImage(named: imageName), for: .normal)
        setBackgroundImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        setImage(UIImage(named: backgroundImageName), for: .normal)
        setImage(UIImage(named: backgroundImageName + "_highlighted"), for: .normal)
        
        sizeToFit()

    }
    
}


