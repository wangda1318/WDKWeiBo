//
//  PicPickerCollectionCell.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/23.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class PicPickerCollectionCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func imagePickerClick() {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNoticifationImagePickerName), object: nil)
        
        
    }
}
