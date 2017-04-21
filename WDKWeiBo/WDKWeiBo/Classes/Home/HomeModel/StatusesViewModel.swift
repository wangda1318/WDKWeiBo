//
//  StatusesViewModel.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/20.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class StatusesViewModel: NSObject {

    var statusesModel: StatusesModel?
    
    var sourceText: String? //处理微博来源
    var verfiedImage: UIImage?
    var vipImage: UIImage?
    var profileURL: URL?
    var picURLs: [URL] = [URL]()
    
    
    init(statusesModel: StatusesModel) {
        super.init()
        
        self.statusesModel = statusesModel
        
        // 认证来源
        if let source = statusesModel.source{
            
            // <a href=\"http://app.weibo.com/t/feed/4fuyNj\" rel=\"nofollow\">即刻笔记</a>
            let startIndex = (source as NSString).range(of: ">").location + 1
            let lengthIndex = (source as NSString).range(of: "</").location - startIndex
            
            sourceText = (source as NSString).substring(with: NSMakeRange(startIndex, lengthIndex))
            
        }
        
        // 认证图片
        let verifiedType = statusesModel.user?.verified_type ?? -1
        switch verifiedType {
        case 0:
            
            verfiedImage = UIImage(named: "avatar_vip")
            break
        case 2,3,5:
            
            verfiedImage = UIImage(named: "avatar_enterprise_vip")
            break
        case 220:
            
            verfiedImage = UIImage(named: "avatar_grassroot")
            break
        default:
            
            verfiedImage = nil
            break
        }
        
        // 等级
        let mbrank = statusesModel.user?.mbrank ?? 0
        if mbrank > 0 && mbrank < 7 {
            
            vipImage = UIImage(named: "common_icon_membership_level\(mbrank)")
            
        }

        // URL
        let urlString = statusesModel.user?.profile_image_url ?? ""
        profileURL = URL(string: urlString)
        
        // picURL
        let picArray = statusesModel.pic_urls?.count != 0 ? statusesModel.pic_urls : statusesModel.retweeted_status?.pic_urls
        
        if picArray != nil {
            
            for picDict in picArray!{
                
                guard let url = picDict["thumbnail_pic"] else {
                    continue
                }
                
                picURLs.append(URL(string: url)!)
            }

        }
        
    }
}
