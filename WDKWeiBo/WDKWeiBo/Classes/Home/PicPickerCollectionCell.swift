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
    @IBOutlet weak var hiddenButton: UIButton!
    @IBOutlet weak var backImageView: UIImageView!

    var cellImage: UIImage? {
        didSet {
            if cellImage != nil {
                
                backImageView.image = cellImage
                imageButton.isUserInteractionEnabled = false
                hiddenButton.isHidden = false
                
                
            } else {
                
                backImageView.image = nil
                imageButton.isUserInteractionEnabled = true
                hiddenButton.isHidden = true

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
    
    @IBAction func imageHiddenClick() {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNoticifationImageHiddenName), object: backImageView.image)
    }
    
}
