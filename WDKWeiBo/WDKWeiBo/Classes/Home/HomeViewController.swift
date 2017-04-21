//
//  HomeViewController.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/3/17.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit
import SDWebImage
import MJRefresh

class HomeViewController: BaseTableViewController {

    lazy var titleButton: CustomTitleButton = CustomTitleButton(title: "林梦兮")
    lazy var statusesArray: [StatusesViewModel] = [StatusesViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView.rotate()
        
        if !isLogin {
            return
        }
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
        
        setupNavigationBar()
        
        setupHeader()
        
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
    
    func setupHeader() {
        
        let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(HomeViewController.loadNewUserStatuses))
        header?.setTitle("下拉刷新", for: .idle)
        header?.setTitle("释放以更新", for: .pulling)
        header?.setTitle("加载中", for: .refreshing)
        
        tableView.mj_header = header
        
        header?.beginRefreshing()
        
    }

}
private extension HomeViewController {
    
    @objc func loadNewUserStatuses() {
        
        loadUserStatuses()
        
        tableView.mj_header.endRefreshing()
        
    }
    
    /// 加载数据
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
                let viewModel = StatusesViewModel(statusesModel: model)
                
                
                self.statusesArray.append(viewModel)
                print(model.description)
            }
            
            cacheImages(models: self.statusesArray)
        }
        
        func cacheImages(models: [StatusesViewModel]) {
            
            let group = DispatchGroup.init()
            
            for model in models {
                for picURL in model.picURLs {
                    
                    group.enter()
                    SDWebImageManager.shared().loadImage(with: picURL, options: [], progress: nil, completed: { (_, _, _, _, _, _) in
                        
                        group.leave()
                        print("下载了一张图片")
                    })
                }
            }
            
            
            group.notify(queue: DispatchQueue.main) {
                self.tableView.reloadData()
                print("刷新")
            }
            
        }
    }
}

extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return statusesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTableViewCell
        
        cell.viewModel = statusesArray[indexPath.row]
        return cell
    }
}
