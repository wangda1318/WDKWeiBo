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
        return tools
        
    }()
    
}

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
