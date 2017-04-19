//
//  OAuthViewController.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/19.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit
import SVProgressHUD

class OAuthViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationItems()
        
        loadPage()
        
        // Do any additional setup after loading the view.
    }


}


private extension OAuthViewController {
    
    func setupNavigationItems() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .plain, target: self, action: #selector(OAuthViewController.closeItem))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "填充", style: .plain, target: self, action: #selector(OAuthViewController.fillItem))
        title = "授权页面"
        
    }
    
    func loadPage() {
        
        let url = "https://api.weibo.com/oauth2/authorize?client_id=\(app_key)&redirect_uri=\(redirect_uri)"
        
        let request = URLRequest(url: URL(string: url)!)
        
        webView.loadRequest(request)
        
        
    }
}

private extension OAuthViewController {
    
    @objc func closeItem() {
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func fillItem() {
        
        let jsCode = "document.getElementById('userId').value='18521057747';document.getElementById('passwd').value='wang123456'"
        webView.stringByEvaluatingJavaScript(from: jsCode)

    }
}

extension OAuthViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
        SVProgressHUD.show()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
        SVProgressHUD.dismiss()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        SVProgressHUD.dismiss()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if (request.url?.absoluteString.contains("code"))! {
            
            let code = request.url!.absoluteString.components(separatedBy: "code=").last!
            
            getAccessToken(code: code)
            
            return false
        }
        
        return true
    }
}

private extension OAuthViewController {
    
    func getAccessToken(code: String) {
        
        let para = ["client_id": app_key, "client_secret": app_secret, "grant_type": "authorization_code", "code": code, "redirect_uri": redirect_uri]
        NetworkTools.sharedInstance.request(method: .POST, URLString: "https://api.weibo.com/oauth2/access_token", parameters: para) { (data, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            print(data as! [String : Any])
            
        }
    
    }
}
