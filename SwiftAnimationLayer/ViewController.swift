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
        
        self.view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.7, alpha: 1.0)
        
        //流星
        let starView = StarMoveView(frame: CGRectMake(0, 0, self.view.frame.size.width, 400))
        self.view .addSubview(starView)
        
        //飘雪
        
        let snowFlow = SnowFlow(frame:self.view.frame)
        self.view.addSubview(snowFlow)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

