//
//  PickPickerCollection.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/23.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class PickPickerCollection: UICollectionView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        dataSource = self
        
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: "picPickerCell")
        
        
    }
    
    
}

extension PickPickerCollection: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "picPickerCell", for: indexPath)
        
        cell.backgroundColor = UIColor.red
        
        return cell
    }
}
