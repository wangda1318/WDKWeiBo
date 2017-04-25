//
//  EmojyViewController.swift
//  Emojy
//
//  Created by 王东开 on 2017/4/24.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class EmojyViewController: UIViewController {

    lazy var emojyCollection: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: EmojyCollectionLayout())
    lazy var menuToolBar: UIToolbar = UIToolbar()
    var emojyManager: EmojyPackageManager = EmojyPackageManager()
    
    var callBack: (_ emojy: Emojy) -> ()
    
    init(callBack: @escaping (_ emojy: Emojy) -> ()) {
        
        self.callBack = callBack
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        setupCollection()
        
        setupToolBar()
        

    }

    
}

private extension EmojyViewController {
    
    func setupUI() {
        
        view.addSubview(emojyCollection)
        view.addSubview(menuToolBar)
        
        emojyCollection.translatesAutoresizingMaskIntoConstraints = false
        menuToolBar.translatesAutoresizingMaskIntoConstraints = false
        
        var cons = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[toolBar]-0-|", options: [], metrics: nil, views: ["toolBar": menuToolBar, "collectionView": emojyCollection])
        
        cons += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[collectionView]-0-[toolBar]-0-|", options: [.alignAllLeft, .alignAllRight], metrics: nil, views: ["toolBar": menuToolBar, "collectionView": emojyCollection])
        
        view.addConstraints(cons)
    }
}

private extension EmojyViewController {
    
    func setupCollection() {
        
        emojyCollection.dataSource = self
        emojyCollection.delegate = self
        
        emojyCollection.register(EmojyCollectionViewCell.self, forCellWithReuseIdentifier: "emojyCell")
        
        emojyCollection.backgroundColor = UIColor(red: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1.0)

    }
    
    func setupToolBar() {
        
        let titles = ["最近", "默认", "emoji", "浪小花"]
        var temp = [UIBarButtonItem]()
        
        for i in 0 ..< titles.count {
            
            let buttonItem = UIBarButtonItem(title: titles[i], style: .plain, target: self, action: #selector(EmojyViewController.itemClick(item:)))
            buttonItem.tag = i
            buttonItem.tintColor = UIColor.orange
            
            let flexItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            
            temp.append(buttonItem)
            temp.append(flexItem)
            
        }
        temp.removeLast()
        menuToolBar.items = temp
    }
}

extension EmojyViewController {
    
    @objc func itemClick(item: UIBarButtonItem) {
        
        print(item.tag)
        
        let indexPath = IndexPath(item: 0, section: item.tag)
        
        emojyCollection.scrollToItem(at: indexPath, at: .left, animated: true)
        
    }
}
extension EmojyViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return emojyManager.packages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
               
        return emojyManager.packages[section].emojys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emojyCell", for: indexPath) as! EmojyCollectionViewCell
        
        let package = emojyManager.packages[indexPath.section]
        let emojy = package.emojys[indexPath.item]
        print(emojy.description)
        
        cell.model = emojy
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let emoji = emojyManager.packages[indexPath.section].emojys[indexPath.item]
        callBack(emoji)

        if emoji.isEmpty || emoji.isDelete {
            return
        }
        if emojyManager.packages.first!.emojys.contains(emoji) {
            
            let index = emojyManager.packages.first!.emojys.index(of: emoji)
            emojyManager.packages.first!.emojys.remove(at: index!)
            
        } else {
            
            emojyManager.packages.first!.emojys.remove(at: 19)
            
        }
        
        emojyManager.packages.first!.emojys.insert(emoji, at: 0)

        
    }
}

private class EmojyCollectionLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        let itemWH = UIScreen.main.bounds.width / 7.0
        itemSize = CGSize(width: itemWH, height: itemWH)
        
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        
        scrollDirection = .horizontal
        
        let edgeMargin = (collectionView!.bounds.height - itemWH * 3) / 2.0
        
        collectionView?.contentInset = UIEdgeInsets(top: edgeMargin, left: 0, bottom: edgeMargin, right: 0)
        collectionView?.isPagingEnabled = true
        collectionView?.showsHorizontalScrollIndicator = false
        
    }
}
