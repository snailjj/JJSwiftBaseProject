//
//  UIScreen_Extension.swift
//  snailjj
//
//  Created by snailjj on 2018/11/11.
//  Copyright © 2018年 snailjj. All rights reserved.
//

import UIKit

public extension UIScreen {
    
    /// 屏幕的范围
    static var bound: CGRect {
        return main.bounds
    }
    
    /// 屏幕的size
    static var size: CGSize {
        return main.bounds.size
    }
    
    /// 屏幕的宽
    static var width: CGFloat {
        return main.bounds.width
    }
    
    /// 屏幕的高
    static var height: CGFloat {
        return main.bounds.height
    }
    
    /// 屏幕大比例大小
    static var scaleForPlus: CGFloat {
        return width / designDrawing
    }
    
    /// 状态栏的高度
    static var statusBarHeight: CGFloat {
        return UIDevice.current.iPhoneX ? 44 : 20
    }
    
    /// 导航栏高度
    static var navigationBarHeight: CGFloat {
        return 44
    }
    
    /// 多出的顶部状态栏高度 iPhoneX为24,其它手机型号都为0
    static var surplusTopStatusBarHeight: CGFloat {
        return UIDevice.current.iPhoneX ? 24 : 0
    }
    
    /// 多出的底部菜单栏高度 iPhoneX为34,其它手机型号都为0
    static var surplusBottomMenuBarHeight: CGFloat {
        return UIDevice.current.iPhoneX ? 34 : 0
    }
    
    /// tabBar的高度 49
    static var tabBarHeight: CGFloat {
        return 49
    }
    
    // 顶部状态栏高度和导航栏高度之和 iPhoneX为88,其它手机型号都为64
    static var statusBarAndNavgationHeight: CGFloat {
        return statusBarHeight + navigationBarHeight
    }
    
    //顶部状态栏高度、导航栏高度、底部菜单栏之和
    static var allBarHeight: CGFloat {
        return statusBarAndNavgationHeight + surplusBottomMenuBarHeight
    }
   
}
