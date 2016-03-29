//
//  StarMove.swift
//  SwiftLearn—Star
//
//  Created by LIAN on 16/3/25.
//  Copyright © 2016年 com.Alice. All rights reserved.
//

import Foundation

import UIKit

class StarMoveView :UIView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.emitterBuild()
        self.animationWithPath()
        
    }

    
    func emitterBuild() {
        
        let  emitterLayer = CAEmitterLayer()
        layer.addSublayer(emitterLayer)
   
        emitterLayer.emitterPosition = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)
        emitterLayer.emitterSize = self.bounds.size
        emitterLayer.emitterShape = kCAEmitterLayerCircle //粒子形状圆形
        emitterLayer.emitterMode = kCAEmitterLayerPoints  //粒子发射类型
        emitterLayer.renderMode = kCAEmitterLayerAdditive // 粒子递增效果
        
        let image1 = UIImage(named: "star")!.CGImage
        let image2 = UIImage(named: "cycle")!.CGImage
        let cell1 = self.produceEmitterCellWithContents(image1!)
        cell1.scale = 0.3
        cell1.scaleRange = 0.2 //范围
        
        let cell2 = self.produceEmitterCellWithContents(image2!)
        cell2.scale = 0.05
        cell2.scaleRange = 0.2
        
        emitterLayer.emitterCells = [cell1,cell2]
        
    }
    
    func produceEmitterCellWithContents(contents:AnyObject) -> CAEmitterCell {
       
        let cell = CAEmitterCell()
        cell.birthRate = 100  //每秒产生粒子数量
        cell.lifetime = 1      //粒子的生存期
        cell.lifetimeRange = 0.3
        cell.contents = contents //粒子的内容
        cell.color = UIColor(red: 0.5, green: 0.7, blue: 0.3, alpha: 0.7).CGColor
        cell.velocity = 50  //粒子速度
        cell.emissionLongitude = CGFloat(M_PI*2.0) //纵向偏移
        cell.emissionRange = CGFloat(M_PI)
        cell.spin = 10 //旋转速度

        return cell
    }
    
    func animationWithPath(){
        
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, 12, 300)
        CGPathAddCurveToPoint(path, nil, 12.00, 300.00, 200.0, 60, 360, 300)
        
        let animation = CAKeyframeAnimation(keyPath:"emitterPosition")
        animation.path = path
        animation.repeatCount = MAXFLOAT
        animation.duration = 4.0
        
//        layer.addAnimation(animation, forKey: .None) //不执行
        
        self.layer.sublayers![0].addAnimation(animation, forKey: .None)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}


