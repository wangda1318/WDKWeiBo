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
    var pic_urls: [[String: String]]?
    
    var user: UserModel?
    
    init(dict: [String: Any]) {
        super.init()
        
        setValuesForKeys(dict)
        
        user = UserModel(dict: dict["user"] as! [String : Any])
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
}
