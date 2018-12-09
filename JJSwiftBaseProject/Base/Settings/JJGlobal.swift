//
//  JJGlobal.swift
//  snailjj
//
//  Created by snailjj on 2018/12/8.
//

import UIKit
import XCGLogger

public let printLog = XCGLogger.default

/// 用来计算比例大小，比如你的设计图是 按照 414设计的 ，那么你需要把这个值传过来，这样UIScreen.scale = UIScree.width / 414
public var designDrawing: CGFloat = 414
