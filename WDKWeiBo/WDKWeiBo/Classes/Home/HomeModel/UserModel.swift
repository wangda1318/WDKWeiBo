//
//  UserModel.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/20.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class UserModel: NSObject {

    var screen_name: String?
    var profile_image_url: String?
    var verified_type: Int = -1
    var mbrank: Int = 0
    
    init(dict: [String: Any]) {
        super.init()
        
        setValuesForKeys(dict)
        
        mbrank = (dict["mbrank"] as? Int)!
        verified_type = (dict["verified_type"] as? Int)!

    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
