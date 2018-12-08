//
//  JJRequestManager.swift
//  snailjj
//
//  Created by snailjj on 2018/11/21.
//

import UIKit
import Alamofire
import XCGLogger

public class JJRequestManager: NSObject {
    
    /// 测试desc
    /// - parameter url:        The URL.
    /// - parameter method:     The HTTP method. `post` by default.
    /// - parameter parameters: The parameters.  by default.
    /// - parameter encoding:   The parameter encoding. `URLEncoding.default` by default.
    /// - parameter header:    The HTTP headers. saasdsa.
    /// - returns: no return.
    
    public class func request(method: HTTPMethod = .post, url: String, parameters: [String: Any] = [:], encoding: URLEncoding = .default, header: [String: String] = [:]) {
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: header).responseJSON { (dataResponse) in
            
//            if JSONSerialization.isValidJSONObject(dataResponse.data as Any) {
                do {
                    let jsonString = try JSONSerialization.jsonObject(with: dataResponse.data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    printLog.debug(jsonString)
                } catch {
                    printLog.debug("Serialization error---\(error.localizedDescription)")
                }
                
//            }
            
        }
    }
    
}
