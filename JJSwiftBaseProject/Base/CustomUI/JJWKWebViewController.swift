//
//  JJWKWebViewController.swift
//  snailjj
//
//  Created by snailjj on 2018/12/5.
//

import UIKit
import WebKit

public class JJWKWebViewController: JJBaseViewController {

    public var urlString: String = ""
    public var webView: JJWKWebView!
    public var progressView: UIProgressView!
    public var config: WKWebViewConfiguration!
    
    //KVO keyPath
    private var estimateProgressKey = "estimateProgress"        //网页加载进度
    private var canGoBackKey = "canGoBack"                      //是不是可以返回
    private var webViewContext = "WKWebViewContext"             //上下文标识
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension JJWKWebViewController {
    
    func initWebView() {
        
    }
    
}
