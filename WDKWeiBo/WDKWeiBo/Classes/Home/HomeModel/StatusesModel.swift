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
        
        
        // 此处用KVC无法获取转发数据
        created_at = dict["created_at"] as? String ?? ""
        source = dict["source"] as? String ?? ""
        text = dict["text"] as? String ?? ""
        mid = dict["mid"] as? String ?? ""
        pic_urls = dict["pic_urls"] as? [[String: String]] ?? []

        if let user = dict["user"] as? [String: Any]{
            
            self.user = UserModel(dict: user)
        }
        
        if let status = dict["retweeted_status"] as? [String: Any] {
            
            self.retweeted_status = StatusesModel(dict: status)
        }
    }
    
    
}
