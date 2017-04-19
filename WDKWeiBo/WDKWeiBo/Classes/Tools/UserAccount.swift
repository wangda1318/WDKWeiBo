//
//  UserAccount.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/19.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class UserAccount: NSObject {

    var access_token: String?
    var expires_in: TimeInterval = 0.0 {
        didSet {
            expires_date = Date(timeIntervalSinceNow: expires_in)
        }
    }
    var uid: String?
    var expires_date: Date?
    var screen_name: String?
    var avatar_large: String?
    
    init(dict: [String: Any]) {
        super.init()
        
        self.setValuesForKeys(dict)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    override var description: String {
        
        return dictionaryWithValues(forKeys: ["access_token", "expires_date", "uid", "screen_name", "avatar_large"]).description
        
    }
}
