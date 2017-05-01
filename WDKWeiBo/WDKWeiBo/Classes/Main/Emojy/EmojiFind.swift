//
//  EmojiFind.swift
//  正则表达式
//
//  Created by 王东开 on 2017/5/1.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class EmojiFind: NSObject {

    lazy var emojiManager : EmojyPackageManager = EmojyPackageManager()
    
    static let shared: EmojiFind = EmojiFind()
    
    func findAttrEmoji(attr: String?, font: UIFont) -> NSMutableAttributedString? {
        
        let regular = "\\[.*?\\]"
        guard let regex1 = try? NSRegularExpression(pattern: regular, options: []) else {
            
            return nil
        }
        
        guard let text = attr else {
            
            return nil
        }
        
        let results = regex1.matches(in: text, options: [], range: NSMakeRange(0, (text as NSString).length))
        let mutableAttr = NSMutableAttributedString(string: text)
        
        for result in results.reversed() {
            
            let emojiName = (text as NSString).substring(with: result.range)
            
            guard let pngPath = getImagePath(chs: emojiName) else {
                
                return nil
            }
            
            
            let attachment = NSTextAttachment()
            attachment.image = UIImage(contentsOfFile: pngPath)
            attachment.bounds = CGRect(x: 0, y: -4, width: font.lineHeight, height: font.lineHeight)
            let attrImageText = NSAttributedString(attachment: attachment)
            
            mutableAttr.replaceCharacters(in: result.range, with: attrImageText)
            
        }
        
        return mutableAttr

    }
}

private extension EmojiFind {
    
    func getImagePath(chs: String) -> String? {
        
        for manager in emojiManager.packages {
            for emoji in manager.emojys {
                
                if chs == emoji.chs {
                    
                    return emoji.pngPath
                }
            }
        }
        
        return nil
    }
}


