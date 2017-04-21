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
    var retweeted_status: StatusesModel?
    
    init(dict: [String: Any]) {
        super.init()
        
        setValuesForKeys(dict)
        
        if let user = dict["user"] {
            
            self.user = UserModel(dict: user as! [String: Any])
        }
        
        if let status = dict["retweeted_status"] {
            
            self.retweeted_status = StatusesModel(dict: status as! [String: Any])
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
}
