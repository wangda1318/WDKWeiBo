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
    var source: String?
    var text: String?
    var mid: String?
    
    init(dict: [String: Any]) {
        super.init()
        
        setValuesForKeys(dict)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
}
