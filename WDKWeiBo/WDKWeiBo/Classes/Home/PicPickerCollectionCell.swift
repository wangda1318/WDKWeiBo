//
//  PicPickerCollectionCell.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/23.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class PicPickerCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imageButton: UIButton!

    var cellImage: UIImage? {
        didSet {
            if cellImage != nil {
                
                imageButton.setBackgroundImage(cellImage!, for: .normal)
                imageButton.isUserInteractionEnabled = false
                
            } else {
                
                imageButton.setBackgroundImage(UIImage(named: "compose_pic_add"), for: .normal)
                imageButton.isUserInteractionEnabled = true

            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func imagePickerClick() {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNoticifationImagePickerName), object: nil)
        
        
    }
}
