//
//  StatusesModel.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/20.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class StatusesModel: NSObject {

    var created_at: String?
    var source: String? {
        didSet {
            
            if source == nil && source == "" {
                return
            }
            // <a href=\"http://app.weibo.com/t/feed/4fuyNj\" rel=\"nofollow\">即刻笔记</a>
            let startIndex = (source! as NSString).range(of: ">").location + 1
            let lengthIndex = (source! as NSString).range(of: "</").location - startIndex
            
            sourceText = (source! as NSString).substring(with: NSMakeRange(startIndex, lengthIndex))
            
        }
    }
    var text: String?
    var mid: String?
    
    var sourceText: String? //处理微博来源
    
    init(dict: [String: Any]) {
        super.init()
        
        setValuesForKeys(dict)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
}
