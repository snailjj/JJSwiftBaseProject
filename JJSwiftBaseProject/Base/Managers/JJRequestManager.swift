//
//  JJRequestManager.swift
//  snailjj
//
//  Created by snailjj on 2018/11/21.
//

import UIKit
import Alamofire

public class JJRequestManager: NSObject {
    
    /// 请求数据
    /// - parameter url:        接口地址
    /// - parameter method:     请求方式，默认post
    /// - parameter parameters: 请求参数，字典类型
    /// - parameter encoding:   参数编码格式 URLEncoding.default
    /// - parameter header:     请求头信息，字典类型
    /// - returns:  completeHandler 返回请求结果 Result<Any>
    
    public class func request(method: HTTPMethod = .post, url: String, parameters: [String: Any] = [:], encoding: URLEncoding = .default, header: [String: String] = [:], completeHandler: @escaping (_ result: Result<Any>) -> Void) {
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: header).responseJSON { (dataResponse) in
            DispatchQueue.global().async {
                printLog.debug()
                completeHandler(dataResponse.result)
            }
        }
    }
    
    /// 上传文件
    /// - parameter url:        接口地址
    /// - parameter method:     请求方式，默认post
    /// - parameter parameters: 请求参数，字典类型
    /// - parameter encoding:   参数编码格式 URLEncoding.default
    /// - parameter header:     请求头信息，字典类型
    /// - returns:  completeHandler 返回请求结果 Result<Any>
    
    public class func upload(url: String, parameters: [String: Any] = [:], header: [String: String] = [:], completeHandler: @escaping (_ result: Result<Any>) -> Void) {
        
    }
    
}
