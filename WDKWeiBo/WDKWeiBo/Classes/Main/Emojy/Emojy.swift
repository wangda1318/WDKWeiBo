//
//  Emojy.swift
//  Emojy
//
//  Created by 王东开 on 2017/4/24.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class Emojy: NSObject {

    var code: String? {
        didSet {
            guard let c = code else {
                return
            }
            
            let scanner = Scanner(string: c)
            
            var value: UInt32 = 0
            
            scanner.scanHexInt32(&value)
            
            let ch = Character(UnicodeScalar(value)!)
            
            emojiPng = String(ch)
            
        }
    }
    var chs: String?
    var png: String? {
        didSet {
            guard let p = png else {
                return
            }
            
            pngPath = Bundle.main.bundlePath + "/Emoticons.bundle/" + p
        }
    }
    
    var pngPath: String?
    var emojiPng: String?
    var isDelete: Bool = false
    var isEmpty: Bool = false
    
    init(deleted: Bool) {
        super.init()
        
        self.isDelete = deleted
        
    }
    
    init(empty: Bool) {
        super.init()
        
        self.isEmpty = empty
    }
    
    init(dict: [String: String]) {
        super.init()
        
        setValuesForKeys(dict)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    override var description: String {
        return "code = \(emojiPng), chs = \(chs)"
    }
}
