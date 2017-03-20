//
//  CustomTitleButton.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/3/20.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class CustomTitleButton: UIButton {

    convenience init(title: String) {
        self.init()
        
        setImage(UIImage(named: "navigationbar_arrow_down"), for: .normal)
        setImage(UIImage(named: "navigationbar_arrow_up"), for: .selected)
        setTitle(title, for: .normal)
        setTitle(title, for: .selected)
        setTitleColor(UIColor.darkGray, for: .normal)
        setTitleColor(UIColor.darkGray, for: .selected)

        sizeToFit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel!.frame.origin.x = 0
        imageView!.frame.origin.x = titleLabel!.frame.size.width + 5
        
    }
}
