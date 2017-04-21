//
//  PicCollection.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/21.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class PicCollection: UICollectionView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        dataSource = self
    }
}

extension PicCollection: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "picCell", for: indexPath)
        
        cell.backgroundColor = UIColor.blue
        
        return cell
        
    }
}

class PicCollectionCell: UICollectionViewCell {
    
    
}

