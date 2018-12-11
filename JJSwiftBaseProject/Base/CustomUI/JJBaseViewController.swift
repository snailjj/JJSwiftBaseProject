//
//  JJBaseViewController.swift
//  snailjj
//
//  Created by snailjj on 2018/12/6.
//

import UIKit

open class JJBaseViewController: UIViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    deinit {
        printLog.debug(self)
        NotificationCenter.default.removeObserver(self)
    }
    
    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension JJBaseViewController {
    
    open func initUI() {
        
    }
    
}
