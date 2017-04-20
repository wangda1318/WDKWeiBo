//
//  HomeViewController.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/3/17.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit

class HomeViewController: BaseTableViewController {

    lazy var titleButton: CustomTitleButton = CustomTitleButton(title: "林梦兮")
    lazy var statusesArray: [StatusesModel] = [StatusesModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView.rotate()
        
        if !isLogin {
            return
        }
        setupNavigationBar()
        
        loadUserStatuses()
        
    }

}

private extension HomeViewController {
    
    func setupNavigationBar() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
        
        titleButton.addTarget(self, action: #selector(HomeViewController.titleClick), for: .touchUpInside)
        navigationItem.titleView = titleButton
    }
}

private extension HomeViewController {
    
    @objc func titleClick() {
        
        titleButton.isSelected = !titleButton.isSelected
        
        let popoverVC = PopoverViewController()
        // 设置为custom时，弹出视图不会隐藏下面界面
        popoverVC.modalPresentationStyle = .custom
        popoverVC.transitioningDelegate = self
        
        present(popoverVC, animated: true, completion: nil)
        
        print("title")
        
    }
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
        
    }
}

private extension HomeViewController {
    func loadUserStatuses() {
        
        NetworkTools.sharedInstance.userStatues { (result, error) in
                        
            if error != nil {
                
                return
            }
            
            guard let resultDict = result else {
                return
            }
            for dict in resultDict {
                
                let model = StatusesModel(dict: dict)
                self.statusesArray.append(model)
                print(model.description)
            }

            self.tableView.reloadData()
            
        }
    }
}

extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return statusesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell")!
        
        let statuses = statusesArray[indexPath.row]
        cell.textLabel?.text = statuses.text
        
        return cell
    }
}
