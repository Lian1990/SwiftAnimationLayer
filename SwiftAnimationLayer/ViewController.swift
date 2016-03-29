//
//  ViewController.swift
//  SwiftAnimationLayer
//
//  Created by LIAN on 16/3/29.
//  Copyright © 2016年 com.Alice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.blueColor()
        
        let starView = StarMoveView(frame: CGRectMake(0, 0, self.view.frame.size.width, 400))
        self.view .addSubview(starView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

