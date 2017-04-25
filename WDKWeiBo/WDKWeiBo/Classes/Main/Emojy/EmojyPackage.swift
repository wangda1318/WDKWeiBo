//
//  EmojyPackage.swift
//  Emojy
//
//  Created by 王东开 on 2017/4/24.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class EmojyPackage: NSObject {

    var emojys: [Emojy] = [Emojy]()
    
    init(name: String) {
        
        if name == "" {
            
            for _ in 0..<20 {
                
                emojys.append(Emojy(empty: true))
            }
            
            emojys.append(Emojy(deleted: true))
            
            return
        }
        
        
        let path = Bundle.main.path(forResource: "\(name)/info.plist", ofType: nil, inDirectory: "Emoticons.bundle")
        
        let array = NSArray(contentsOfFile: path!) as! [[String: String]]
        var index = 0
        
        for var dict in array {
            index += 1
            if let png = dict["png"] {
                dict["png"] = "\(name)/" + png
            }
            let emoji = Emojy(dict: dict)
            emojys.append(emoji)
            
            if index == 20 {
                
                emojys.append(Emojy(deleted: true))
                index = 0
            }
        }
        
        
        
        if emojys.count % 21 == 0 {
            
            return
        }
        
        for _ in 0..<array.count % 21 {
            
            emojys.append(Emojy(empty: true))
        }
        
        emojys.append(Emojy(deleted: true))
        
        
    }
}
