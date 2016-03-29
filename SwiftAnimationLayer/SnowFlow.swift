//
//  SnowFlow.swift
//  SwiftAnimationLayer
//
//  Created by LIAN on 16/3/29.
//  Copyright © 2016年 com.Alice. All rights reserved.
//

/**
*  下雪的效果  可以利用成 之前的掉金币的效果 视觉动画
*/


import Foundation
import UIKit

class SnowFlow :UIView {
    
    override init(frame:CGRect){
        
        super.init(frame: frame)
        self.buildSnowStage()
        
    }
    /**
     * 雪花设置
     */
    func buildSnowStage()
    {
        //kCAEmitterLayerLine  线性
        //kCAEmitterLayerPoint  点状 可以做喷泉啊
        //kCAEmitterLayerCuboid 立方体
        //kCAEmitterLayerCircle 环状
        //kCAEmitterLayerSphere 球状
        //kCAEmitterLayerRectangle 矩形
        
        
        
        let emitter = CAEmitterLayer()
        emitter.frame = self.frame
        layer.addSublayer(emitter)
        emitter.emitterShape = kCAEmitterLayerLine
        emitter.emitterPosition = CGPointMake(self.frame.size.width/2, 10)
        emitter.emitterSize = self.frame.size
        
        //=== 下雪用线性的比较好 在Y轴上设置起始位置 只有向下的
        
        let cell = CAEmitterCell()
        cell.contents = UIImage(named: "cycle")!.CGImage
        cell.birthRate = 20 //每秒产生粒子数
        cell.lifetime = 4.0  //粒子的存活时间
        cell.lifetimeRange = 1.0
        
        emitter.emitterCells = [cell]
        
        cell.xAcceleration = 20.0 //x轴的加速度
        cell.yAcceleration = 60.0 //y轴上的加速度
        cell.velocity = 10.0  //初始速度
        cell.velocityRange = 100.0 //随机速度范围
        cell.emissionRange = CGFloat(M_PI_2)
        cell.emissionLongitude = CGFloat(-M_PI) //偏移量
        cell.scale = 0.2
        cell.scaleRange = 0.2 //大小 0-0.4
        cell.scaleSpeed = -0.15

        cell.redRange = 0.3
        cell.greenRange = 0.3
        cell.blueRange = 0.3
        
        cell.alphaRange = 0.75 //随机透明度
        cell.alphaSpeed = -0.15 //逐渐消失
        

        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
}
