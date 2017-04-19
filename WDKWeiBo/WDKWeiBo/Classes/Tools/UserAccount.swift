//
//  UserAccount.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/19.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class UserAccount: NSObject, NSCoding {

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
    
    required init?(coder aDecoder: NSCoder) {
        
        access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        expires_date = aDecoder.decodeObject(forKey: "expires_date") as? Date
        uid = aDecoder.decodeObject(forKey: "uid") as? String
        avatar_large = aDecoder.decodeObject(forKey: "avatar_large") as? String
        screen_name = aDecoder.decodeObject(forKey: "screen_name") as? String
        
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(access_token, forKey: "access_token")
        aCoder.encode(expires_date, forKey: "expires_date")
        aCoder.encode(uid, forKey: "uid")
        aCoder.encode(screen_name, forKey: "screen_name")
        aCoder.encode(avatar_large, forKey: "avatar_large")
        
    }

}

