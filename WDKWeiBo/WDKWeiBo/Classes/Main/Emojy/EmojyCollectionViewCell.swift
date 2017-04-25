//
//  EmojyCollectionViewCell.swift
//  Emojy
//
//  Created by 王东开 on 2017/4/24.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class EmojyCollectionViewCell: UICollectionViewCell {
    
    var model: Emojy? {
        didSet {
            guard let e = model else {
                return
            }
            
            emojiButton.setImage(UIImage(contentsOfFile: e.pngPath ?? ""), for: .normal)
            emojiButton.setTitle(e.emojiPng, for: .normal)
            
            if e.isDelete {
                
                emojiButton.setImage(UIImage(named: "compose_emotion_delete"), for: .normal)
                
            }
            
            if e.isEmpty {
                
                emojiButton.setImage(UIImage(named: ""), for: .normal)

            }
        }
    }
    lazy var emojiButton: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        emojiButton.frame = contentView.bounds
        
        contentView.addSubview(emojiButton)
        
        emojiButton.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        
        emojiButton.isUserInteractionEnabled = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
