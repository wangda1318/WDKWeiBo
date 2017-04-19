//
//  UserAccountTools.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/19.
//  Copyright © 2017年 王东开. All rights reserved.
//

import Foundation

class UserAccountViewModel {

    static let shareInstance: UserAccountViewModel = UserAccountViewModel()
    var userAccount: UserAccount?
    
    var path: String{
    
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return (filePath as NSString).appendingPathComponent("account")
    }
    
    init() {
        userAccount = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? UserAccount
    }
    
    var isLogin: Bool {
        
        if userAccount == nil {
            return false
        }
        
        guard let expireDate = userAccount!.expires_date else {
            
            return false
        }
        
        return expireDate.compare(Date()) == ComparisonResult.orderedDescending
    }
}
