//
//  PicCollection.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/21.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class PicCollection: UICollectionView {

    var picURLs: [URL]? {
        didSet {
            self.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dataSource = self
    }
}

extension PicCollection: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return picURLs?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "picCell", for: indexPath) as! PicCollectionCell
        
        cell.picURL = picURLs?[indexPath.item]
        
        return cell
        
    }
}

class PicCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var picImageView: UIImageView!
    var picURL: URL? {
        didSet {
            
            guard let url = picURL else {
                return
            }
            
            picImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "empty_picture"))
            
        }
    }
}

