//
//  WelcomeViewController.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/20.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit
import SDWebImage

class WelcomeViewController: UIViewController {

    @IBOutlet weak var avatorImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avatorBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avatorImage.layer.cornerRadius = 45
        avatorImage.layer.masksToBounds = true
        
        let urlString = UserAccountViewModel.shareInstance.userAccount?.avatar_large
        let url = URL(string: urlString ?? "")
        
        avatorImage.sd_setImage(with: url, placeholderImage: UIImage(named: "avatar_default_big"))
        
        avatorBottomConstraint.constant = UIScreen.main.bounds.size.height - 200
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: [], animations: { 
            
            self.view.layoutIfNeeded()
        }) { (_) in
            
            UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()

        }
        
        
    
    }

    
}
