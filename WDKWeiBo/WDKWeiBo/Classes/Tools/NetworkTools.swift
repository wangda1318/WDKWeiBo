//
//  NetworkTools.swift
//  WDKWeiBo
//
//  Created by 王东开 on 2017/4/19.
//  Copyright © 2017年 王东开. All rights reserved.
//

import UIKit
import AFNetworking

enum MethodType : String {
    case GET = "GET"
    case POST = "POST"
}

class NetworkTools: AFHTTPSessionManager {

    // 创建单例
    static let sharedInstance : NetworkTools = {
    
        let tools = NetworkTools()
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tools
        
    }()
    
}


// MARK: - 网络请求
extension NetworkTools {
    
    func request(method: MethodType ,URLString: String, parameters: [String: Any]?, finished: @escaping(_ data: Any?, _ error: Error?) -> ()) {
        
        let successBlock = { (task: URLSessionDataTask, data: Any) -> Void in
            finished(data, nil)
        }
        
        let failureBlock = { (task: URLSessionDataTask?, error: Error) -> Void in
            finished(nil, error)
        }
        
        switch method {
        case .GET:

            get(URLString, parameters: parameters, progress: nil, success: successBlock, failure: failureBlock)
            break
            
        default:
            
            post(URLString, parameters: parameters, progress: nil, success: successBlock, failure: failureBlock)
            break
        }
        
    }
}


// MARK: - 获取accessToken
extension NetworkTools {
    
    func accessToken(code: String, finished: @escaping (_ result: [String : Any]?, _ error: Error?) -> ()) {
        
        let para = ["client_id": app_key, "client_secret": app_secret, "grant_type": "authorization_code", "code": code, "redirect_uri": redirect_uri]
        
        
        request(method: .POST, URLString: "https://api.weibo.com/oauth2/access_token", parameters: para) { (data, error) in
            
            finished(data as? [String : Any], error)
        }
    }
}


// MARK: - 请求用户信息
extension NetworkTools {
    
    func userInfo(accessToken: String, uid: String, finished: @escaping (_ result: [String: Any]?, _ error: Error?) -> ()) {
        
        let para = ["access_token": accessToken, "uid": uid]
        
        request(method: .GET, URLString: "https://api.weibo.com/2/users/show.json", parameters: para) { (data, error) in
            finished(data as? [String : Any], error)
            
        }
    }
}


// MARK: - 获取用户微博数据
extension NetworkTools {
    
    func userStatues(sinceID: String, maxID: String ,finished: @escaping (_ result: [[String: Any]]?, _ error: Error?) -> ()) {
        
        let para = ["access_token": UserAccountViewModel.shareInstance.userAccount?.access_token!, "since_id": sinceID, "max_id": maxID]
        
        request(method: .GET, URLString: "https://api.weibo.com/2/statuses/home_timeline.json", parameters: para) { (result, error) in
            
            // 获取statuses对应的数据
            
            guard let statusesDiict = result as? [String: Any] else {
                return
            }
            
            guard let statusesArray = statusesDiict["statuses"] else {
                return
            }
                        
            finished(statusesArray as? [[String : Any]] , error)
            
        }
    }
}


// MARK: - 发送微博
extension NetworkTools {
    
    func postWB(text: String, success: @escaping(_ isPost: Bool) -> ()) {
                
        let para = ["access_token": UserAccountViewModel.shareInstance.userAccount?.access_token, "status": text]
        
        request(method: .POST, URLString: "https://api.weibo.com/2/statuses/update.json", parameters: para) { (result, error) in
            
            if result != nil {
                
                success(true)
            } else {
                
                success(false)
            }
        }
    }
}
