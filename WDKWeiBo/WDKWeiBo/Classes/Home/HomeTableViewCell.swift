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
    
    let itemMargin: CGFloat = 15
    let edgeWidth: CGFloat = 10

    @IBOutlet weak var picCollectionWCon: NSLayoutConstraint!
    @IBOutlet weak var picCollectionHCon: NSLayoutConstraint!
    
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
            
            picCollectionWCon.constant = setupCollectionViewCell(count: model.picURLs.count).width
            picCollectionHCon.constant = setupCollectionViewCell(count: model.picURLs.count).height
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.layer.cornerRadius = 20
        profileImage.layer.masksToBounds = false
        
    }

    
}

private extension HomeTableViewCell {
    
    func setupCollectionViewCell(count: Int) -> CGSize {
        
        if count == 0 {
            
            return CGSize(width: 0, height: 0)
        }
        
        if count == 4 {
            
            let itemWidth = (UIScreen.main.bounds.size.width - 2 * itemMargin - edgeWidth) / 2.0
            
            return CGSize(width: itemWidth * 2 + edgeWidth, height: itemWidth * 2 + edgeWidth)
        }
        
        let lineNumber = (count - 1) / 3 + 1
        let itemWidth = (UIScreen.main.bounds.size.width - 2 * itemMargin - edgeWidth * 2) / 3.0

        return CGSize(width: itemWidth * 3 + 2 * edgeWidth, height: itemWidth * CGFloat(lineNumber) + CGFloat(lineNumber - 1) * edgeWidth)
        
    }
}
