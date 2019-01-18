//
//  JJAudioServicePlayManager.swift
//  Alamofire
//
//  Created by snailjj on 2019/1/18.
//

import UIKit
import AudioToolbox

/// 音效时长最长为28s，此类最好用于播放短暂音频，例如：推送的声音等等
public class JJAudioServicePlayManager: NSObject {

    /// 根据文件的urlString，进行播放
    /// - parameter withUrlString:  文件地址的字符串类型
    /// - parameter shake:  是否有震动，默认震动
    /// - returns:  no returns
    public class func play(withUrlString: String, shake: Bool = true) {
        if let url = URL(string: withUrlString) {
            play(withUrl: url, shake: shake)
        } else {
            
            return
        }
    }
    
    /// 根据文件的URL，进行播放
    /// - parameter withUrl:  文件地址
    /// - parameter shake:  是否有震动，默认震动
    /// - returns:  no returns
    public class func play(withUrl: URL, shake: Bool = true) {
        var soundId: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(withUrl as CFURL, &soundId)
        
        if shake {
            if #available(iOS 9.0, *) {
                AudioServicesPlayAlertSoundWithCompletion(soundId) {
                    AudioServicesDisposeSystemSoundID(soundId)
                }
            } else {
                AudioServicesPlayAlertSound(soundId)
            }
        } else {
            if #available(iOS 9.0, *) {
                AudioServicesPlaySystemSoundWithCompletion(soundId) {
                    AudioServicesDisposeSystemSoundID(soundId)
                }
            } else {
                AudioServicesPlaySystemSound(soundId)
            }
        }
        
    }
    
    
    
}
