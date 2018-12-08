//
//  UIScreen_Extension.swift
//  snailjj
//
//  Created by snailjj on 2018/11/11.
//  Copyright © 2018年 snailjj. All rights reserved.
//

import UIKit

public extension UIScreen {
    
    /// screen bounds
    static var bound: CGRect {
        return main.bounds
    }
    
    // screen size
    static var size: CGSize {
        return main.bounds.size
    }
    
    // screen width
    static var width: CGFloat {
        return main.bounds.width
    }
    
    // screen height
    static var height: CGFloat {
        return main.bounds.height
    }
    
    // screen scale
    static var scaleForPlus: CGFloat {
        return width / 375
    }
    
    // iPhone X; XS; SX Max; XR 的辨别
    static var isIPhoneX: Bool {
        var iPhoneX: Bool = false
        if UIDevice.current.userInterfaceIdiom != .phone {
            return iPhoneX
        }
        if #available(iOS 11.0, *) {
            if let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom, bottom > 0.0 {
                iPhoneX = true
            }
        }
        return iPhoneX
    }
    
    // status height
    static var statusBarHeight: CGFloat {
        return isIPhoneX ? 44 : 20
    }
    
    // navigationBar height
    static var navigationHeight: CGFloat {
        return 44
    }
    
    // 多出的顶部状态栏高度 iPhoneX为24,其它手机型号都为0
    static var extraStatusBarHeight: CGFloat {
        return isIPhoneX ? 24 : 0
    }
    
    // 多出的底部菜单栏高度 iPhoneX为34,其它手机型号都为0
    static var extraMenuBarHeight: CGFloat {
        return isIPhoneX ? 34 : 0
    }
    
    // tabBar的高度 49
    static var tabbarHeight: CGFloat {
        return 49
    }
    
    // 顶部状态栏高度和导航栏高度之和 iPhoneX为88,其它手机型号都为64
    static var statusBarAndNavgationHeight: CGFloat {
        return statusBarHeight + navigationHeight
    }
    
    //顶部状态栏高度、导航栏高度、底部菜单栏之和
    static var allBarHeight:CGFloat {
        return statusBarAndNavgationHeight+extraMenuBarHeight
    }
    
    // 是否是 除了 iPhone4 外 苹果设备
    static var isIPhoneExceptIPhone4: Bool {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return UIScreen.width != 320
        } else {
            return false
        }
    }
   
}
