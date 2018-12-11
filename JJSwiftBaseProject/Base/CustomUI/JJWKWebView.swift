//
//  JJWKWebView.swift
//  snailjj
//
//  Created by snailjj on 2018/12/5.
//

import UIKit
import WebKit
import MJRefresh



public class JJWKWebView: WKWebView {

    typealias PullDownRefresh = () -> Void

    var pullDownRefresh: PullDownRefresh?
    var header: MJRefreshNormalHeader?
    
    /// 是否可以下拉刷新，设为true，即可下拉刷新
    
    var isCanPulLDownRefresh = false {
        willSet {
            if newValue {
                if header == nil {
                    header = MJRefreshNormalHeader(refreshingBlock: {[unowned self] in
                        self.scrollView.contentInset = .zero
                        self.pullDownRefresh?()
                    })
                    header?.lastUpdatedTimeLabel.isHidden = true
                    scrollView.mj_header = header
                } else {
                    scrollView.mj_header = nil
                }
            }
        }
    }
    
    /// 结束下拉刷新
    var isEndPullDownRefresh = false {
        willSet {
            if newValue {
                if scrollView.mj_header != nil {
                    scrollView.contentInset = UIEdgeInsets.zero
                    scrollView.mj_header.endRefreshing()
                }
            }
        }
    }
    
    deinit {
        printLog.debug(self)
        NotificationCenter.default.removeObserver(self)
    }
    
}
