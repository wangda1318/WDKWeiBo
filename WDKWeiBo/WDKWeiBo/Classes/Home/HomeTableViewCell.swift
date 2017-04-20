//
//  HomeTableViewCell.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/20.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var vertifiedImage: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var vipImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var viewModel: StatusesViewModel? {
        didSet {
            guard let model = viewModel else {
                
                return
            }
            
            profileImage.sd_setImage(with: model.profileURL, placeholderImage: UIImage(named: ""))
            vertifiedImage.image = model.verfiedImage
            nickNameLabel.text = model.statusesModel?.user?.screen_name
            nickNameLabel.textColor = model.vipImage == nil ? UIColor.black : UIColor.orange
            vipImage.image = model.vipImage
            timeLabel.text = model.statusesModel?.created_at
            sourceLabel.text = model.sourceText
            contentLabel.text = model.statusesModel?.text
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.layer.cornerRadius = 20
        profileImage.layer.masksToBounds = false
        
    }

    
}
