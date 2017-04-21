//
//  CustomTextView.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/21.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit
import SnapKit

class CustomTextView: UITextView {

    lazy var placeholderLabel: UILabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupTextView()
    }
}

private extension CustomTextView {
    
    func setupTextView() {
        
        addSubview(placeholderLabel)
        
        placeholderLabel.frame = CGRect(x: 10, y: 8, width: 100, height: 15)
        
        placeholderLabel.text = "分享新鲜事..."
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.font = font
        
        textContainerInset = UIEdgeInsets(top: 6, left: 6, bottom: 0, right: 8)
        
    }
}
