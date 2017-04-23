//
//  PickPickerCollection.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/23.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

private let identifier = "picPickerCollectionCell"

class PickPickerCollection: UICollectionView {

    var imageArray: [UIImage] = [UIImage]() {
        didSet {
            reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dataSource = self
        
        register( UINib(nibName: "PicPickerCollectionCell", bundle: nil), forCellWithReuseIdentifier: identifier)
       
    }
    
    
}

extension PickPickerCollection: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageArray.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PicPickerCollectionCell
        
        cell.cellImage = indexPath.item < imageArray.count ? imageArray[indexPath.item] : nil
        
        return cell
    }
}
