//
//  EmojyPackageManager.swift
//  Emojy
//
//  Created by 王东开 on 2017/4/24.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class EmojyPackageManager: NSObject {

    var packages: [EmojyPackage] = [EmojyPackage]()
    
    override init() {
        
        // 最近
        let recentPackage = EmojyPackage(name: "")
        
        // emoji
        let emojyPackage = EmojyPackage(name: "com.apple.emoji")
        
        // 默认
        let defaultPackage = EmojyPackage(name: "com.sina.default")

        // 浪小花
        let lxhPackage = EmojyPackage(name: "com.sina.lxh")

        packages.append(recentPackage)
        packages.append(defaultPackage)
        packages.append(emojyPackage)
        packages.append(lxhPackage)

    }
}
