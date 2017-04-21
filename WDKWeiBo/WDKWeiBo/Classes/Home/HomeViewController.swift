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
    lazy var tipLabel: UILabel = UILabel()
    
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
        setupFooter()
        
        setupTipLabel()
        
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
        
//        present(popoverVC, animated: true, completion: nil)
        
        print("title")
        
    }
}

private extension HomeViewController {
    
    func setupTipLabel() {
        
        tipLabel.frame = CGRect(x: 0, y: 10, width: UIScreen.main.bounds.width, height: 32)
        
        navigationController?.navigationBar.insertSubview(tipLabel, at: 0)
        
        tipLabel.backgroundColor = UIColor.orange
        tipLabel.textAlignment = .center
        tipLabel.textColor = UIColor.white
        tipLabel.font = UIFont.boldSystemFont(ofSize: 14)
        tipLabel.isHidden = true
        
        
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
    
    func setupFooter() {
        
        tableView.mj_footer = MJRefreshAutoFooter(refreshingTarget: self, refreshingAction: #selector(HomeViewController.loadNewMoreStatuses))
        
    }

}
private extension HomeViewController {
    
    @objc func loadNewUserStatuses() {
        
        loadUserStatuses(isNewData: true)
        
    }
    
    @objc func loadNewMoreStatuses() {
        
        loadUserStatuses(isNewData: false)
        
    }

    /// 加载数据
    func loadUserStatuses(isNewData: Bool) {
        
        var sinceID = "0"
        var maxID = "0"
        
        if isNewData {
            
            sinceID = statusesArray.first?.statusesModel?.mid ?? "0"
        } else {
            
            maxID = statusesArray.last?.statusesModel?.mid ?? "0"
        }
        
        
        NetworkTools.sharedInstance.userStatues(sinceID: sinceID, maxID: maxID) { (result, error) in
            
            if error != nil {
                
                return
            }
            
            guard let resultDict = result else {
                return
            }
            
            var array: [StatusesViewModel] = [StatusesViewModel]()
            
            for dict in resultDict {
                
                let model = StatusesModel(dict: dict)
                let viewModel = StatusesViewModel(statusesModel: model)
                
                array.append(viewModel)
            }
            
            if isNewData {
                
                self.statusesArray = array + self.statusesArray
            } else {
                
                array.remove(at: 0)
                self.statusesArray = self.statusesArray + array
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
                    })
                }
            }
            
            
            group.notify(queue: DispatchQueue.main) {
                self.tableView.reloadData()
                
                self.tableView.mj_header.endRefreshing()
                self.tableView.mj_footer.endRefreshing()
                
                self.tipLabel.text = "更新了 \(models.count) 条微博"
                self.tipLabel.isHidden = false
                
                UIView.animate(withDuration: 1.5, animations: {
                    
                    self.tipLabel.frame.origin.y = 44
                }, completion: { (_) in
                    
                    UIView.animate(withDuration: 1.5, delay: 1.0, options: [], animations: { 
                        
                        self.tipLabel.frame.origin.y = 10
                    }, completion: { (_) in
                        
                        self.tipLabel.isHidden = true
                    })
                })
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
