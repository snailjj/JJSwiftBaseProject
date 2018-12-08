//
//  UIDevice+Extension.swift
//  snailjj
//
//  Created by snailjj on 2018/12/08.
//  Copyright © 2018年 snailjj. All rights reserved.
//

import Foundation
import KeychainSwift
import LocalAuthentication

public extension UIDevice {
    
    /// 设备编号
    var deviceId: String {
        get {
            if let aDeviceId = KeychainSwift().get(JJKey.deviceId) {
                return aDeviceId
            } else {
                let aDeviceId = UIDevice.current.identifierForVendor?.uuidString ?? "Fail----ErrorDeviceId"
                KeychainSwift().set(aDeviceId, forKey: JJKey.deviceId)
                return aDeviceId
            }
        }
    }
    
    /// 操作系统
    var osVersion: String {
        get {
            return UIDevice.current.systemName + " " + UIDevice.current.systemVersion
        }
    }
    
    /// 应用版本 CFBundleShortVersionString
    var appVersion: String {
        get {
            return ((Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? "Fail——ErrorAppVersion")
        }
    }
    
    /// 构建版本 CFBundleVersion
    var appBuildVersion: String {
        get {
            return (Bundle.main.infoDictionary?["CFBundleVersion"] as? String) ?? "Fail——ErrorAppBuildVersion"
        }
    }
    
    
    /// 是否是iPhone X
    var iPhoneX: Bool {
        get {
            var model = ""
            switch modelName {
            case "Simulator":
                model = ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"]!
            default:
                model = identifier
            }
            return model == "iPhone10,3" || model == "iPhone10,6" || model.hasPrefix("iPhone11,")
        }
    }
    
    
    /// 设备是否可以用faceID
    var canUseFaceID: Bool {
        get {
            if #available(iOS 11.0, *) {
                let context = LAContext.init()
                if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
                    return context.biometryType == .faceID
                }
            }
            return false
        }
    }
    
    /// 设备是否可以用TouchID
    var canUseTouchID: Bool {
        get {
            return false
        }
    }
    
    /// 得到设备的 identifier, 例如iPhone10,3、iPhone11,6, 模拟器也对应模拟显示成真实的identifier
    var identifier: String {
        get {
            var systemInfo = utsname()
            uname(&systemInfo)
            let machineMirror = Mirror(reflecting: systemInfo.machine)
            let tempIdentifier = machineMirror.children.reduce("") { result, dic in
                let value = dic.value as? Int8
                guard value != 0 else { return result }
                return result + String(UnicodeScalar(UInt8(value!)))
            }
            return tempIdentifier
        }
    }
    
    // 设备型号
    var modelName: String {
        get {
            switch identifier {
            case "iPod5,1":                                     return "iPod Touch 5"
            case "iPod7,1":                                     return "iPod Touch 6"
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":         return "iPhone 4"
            case "iPhone4,1":                                   return "iPhone 4s"
            case "iPhone5,1", "iPhone5,2":                      return "iPhone 5"
            case "iPhone5,3", "iPhone5,4":                      return "iPhone 5c"
            case "iPhone6,1", "iPhone6,2":                      return "iPhone 5s"
            case "iPhone7,2":                                   return "iPhone 6"
            case "iPhone7,1":                                   return "iPhone 6 Plus"
            case "iPhone8,1":                                   return "iPhone 6s"
            case "iPhone8,2":                                   return "iPhone 6s Plus"
            case "iPhone8,4":                                   return "iPhone SE"
            case "iPhone9,1", "iPhone9,3":                      return "iPhone 7"
            case "iPhone9,2", "iPhone9,4":                      return "iPhone 7 Plus"
            case "iPhone10,1", "iPhone10,4":                    return "iPhone 8"
            case "iPhone10,2", "iPhone10,5":                    return "iPhone 8 Plus"
            case "iPhone10,3", "iPhone10,6":                    return "iPhone X"
            case "iPhone11,2":                                  return "iPhone XS"
            case "iPhone11,4", "iPhone11,6":                    return "iPhone XS Max"
            case "iPhone11,8":                                  return "iPhone XR"
            case "iPad2,5", "iPad2,6", "iPad2,7":               return "iPad Mini"
            case "iPad4,4", "iPad4,5", "iPad4,6":               return "iPad Mini 2"
            case "iPad4,7", "iPad4,8", "iPad4,9":               return "iPad Mini 3"
            case "iPad5,1", "iPad5,2":                          return "iPad Mini 4"
            case "iPad1,1":                                     return "iPad"
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":    return "iPad 2"
            case "iPad3,1", "iPad3,2", "iPad3,3":               return "iPad(3rd)"
            case "iPad3,4", "iPad3,5", "iPad3,6":               return "iPad(4th)"
            case "iPad4,1", "iPad4,2", "iPad4,3":               return "iPad Air"
            case "iPad5,3", "iPad5,4":                          return "iPad Air 2"
            case "iPad6,7", "iPad6,8":                          return "iPad Pro(12.9)"
            case "iPad6,3", "iPad6,4":                          return "iPad Pro(9.7)"
            case "iPad6,11", "iPad6,12":                        return "iPad(5th)"
            case "iPad7,1", "iPad7,2":                          return "iPad Pro(12.9)(2th)"
            case "iPad7,3", "iPad7,4":                          return "iPad Pro(10.5)"
            case "iPad7,5", "iPad7,6":                          return "iPad(6th)"
            case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":    return "iPad Pro(11)"
            case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":    return "iPad Pro(12.9)(3rd)"
            case "i386", "x86_64":                              return "Simulator"
            default:                                            return "未知型号"
            }
        }
    }
    
}
