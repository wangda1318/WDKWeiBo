//
//  ComposeViewController.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/21.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

private let edgeWidth: CGFloat = 15

class ComposeViewController: UIViewController {

    @IBOutlet weak var composeTextView: CustomTextView!
    @IBOutlet weak var imagePickerCollection: PickPickerCollection!
    
    @IBOutlet weak var toolBar: UIToolbar!
    
    @IBOutlet weak var toolBarBCon: NSLayoutConstraint!
    @IBOutlet weak var ImagePickerHCon: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigation()
        
        // MARK: - 键盘

        NotificationCenter.default.addObserver(self, selector: #selector(ComposeViewController.keyboardWillShow(noticifation:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ComposeViewController.keyboardDidHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let layout = imagePickerCollection.collectionViewLayout as! UICollectionViewFlowLayout
        let itemWidth = (UIScreen.main.bounds.width - 4 * edgeWidth) / 3.0
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        imagePickerCollection.contentInset = UIEdgeInsetsMake(edgeWidth, edgeWidth, 0, edgeWidth)
        // Do any additional setup after loading the view.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        composeTextView.becomeFirstResponder()
        
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
    }
    
//    图片选择
    @IBAction func imagePicker() {
        
        ImagePickerHCon.constant = UIScreen.main.bounds.height * 0.65
        self.composeTextView.resignFirstResponder()

        UIView.animate(withDuration: 0.25) {
            
            self.view.layoutIfNeeded()
            
        }
    }
}


private extension ComposeViewController {
    
    func setupNavigation() {
        
        title = "发微博"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .plain, target: self, action: #selector(ComposeViewController.close))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "发布", style: .plain, target: self, action: #selector(ComposeViewController.send))
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        
        
    }
    
    
}

extension ComposeViewController {
    
    @objc func keyboardWillShow(noticifation: NSNotification) {
        
        
        print(noticifation.userInfo!)

        let frame = (noticifation.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        toolBarBCon.constant = frame.height
        
        UIView.animate(withDuration: 0.25) { 
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardDidHide() {
        
        toolBarBCon.constant = 0
        
    }
}

private extension ComposeViewController {
    
    @objc func close() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc func send() {
        
        
    }
}

extension ComposeViewController : UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        self.composeTextView.placeholderLabel.isHidden = textView.hasText
        navigationItem.rightBarButtonItem?.isEnabled = textView.hasText
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        self.composeTextView.resignFirstResponder()
        
    }
}
