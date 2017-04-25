//
//  UITextView+Extension.swift
//  Emojy
//
//  Created by 王东开 on 2017/4/25.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

extension UITextView {
    
    func getEmoticon() -> String {
        
        let text = NSMutableAttributedString(attributedString: attributedText)
        
        attributedText.enumerateAttributes(in: NSMakeRange(0, attributedText.length), options: []) { (dict, range, _) in
            
            if let attachment = dict["NSAttachment"] {
                text.replaceCharacters(in: range, with: (attachment as! EmojiTextAttachment).chs!)
                
            }
            
            
            
        }
        
        return text.string

    }
    
    func insertEmoticon(emojy: Emojy) {
        
        if emojy.isEmpty {
            
            return
        }
        
        if emojy.isDelete {
            
            deleteBackward()
            return
        }
        
        if emojy.emojiPng != nil {
            
            let range = selectedTextRange!
            replace(range, withText: emojy.emojiPng!)
            return
        }
        
        if emojy.pngPath != nil {
            
            let attachment = EmojiTextAttachment()
            attachment.chs = emojy.chs
            attachment.image = UIImage(contentsOfFile: emojy.pngPath!)
            
            let font = self.font!
            attachment.bounds = CGRect(x: 0, y: -4, width: font.lineHeight, height: font.lineHeight)
            
            let attrText = NSAttributedString(attachment: attachment)
            
            let mutableText = NSMutableAttributedString(attributedString: attributedText)
            
            let range = self.selectedRange
            mutableText.replaceCharacters(in: NSMakeRange(range.location, 0), with: attrText)
            
            
            attributedText = mutableText
            
            selectedRange = NSMakeRange(range.location+1, 0)
            
            self.font = font
            
            return
        }
 
    }
}
