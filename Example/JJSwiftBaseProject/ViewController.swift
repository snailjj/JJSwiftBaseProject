//
//  ViewController.swift
//  JJSwiftBaseProject
//
//  Created by snailjj on 12/05/2018.
//  Copyright (c) 2018 snailjj. All rights reserved.
//

import UIKit
import JJSwiftBaseProject

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        designDrawing = 375
        printLog.debug(UIScreen.scaleForPlus)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

