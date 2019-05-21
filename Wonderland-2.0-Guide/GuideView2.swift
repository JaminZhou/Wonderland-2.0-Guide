//
//  GuideView2.swift
//  Wonderland-2.0-Guide
//
//  Created by JaminZhou on 2017/4/23.
//  Copyright © 2017年 Hangzhou Tomorning Technology Co., Ltd. All rights reserved.
//

import UIKit

class GuideView2: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        addBack()
    }
    
    func showAnimation() {
        showLeafAnimation()
        showSnowAnimation()
    }
    
    func addBack() {
        let back = UIImageView(frame: bounds)
        back.image = #imageLiteral(resourceName: "guide_back2")
        addSubview(back)
    }
    
    func showLeafAnimation() {
        let wRatio = bounds.size.width/375.0
        let hRatio = bounds.size.height/667.0
        let leaf = UIImageView(frame: CGRect(x: 0, y: 0, width: 34*wRatio, height: 45*hRatio))
        leaf.image = #imageLiteral(resourceName: "leaf")
        leaf.layer.anchorPoint = CGPoint(x: 22/34.0, y: 0)
        leaf.layer.position = CGPoint(x: 210*wRatio, y: 415*hRatio)
        addSubview(leaf)
        
        leafAnimation(leaf, clockwise: true)
    }
    
    func leafAnimation(_ leaf: UIView, clockwise: Bool) {
        let random = (Double(arc4random()%10)+1)/10.0
        
        let rotationAnimation = POPSpringAnimation(propertyNamed: kPOPLayerRotation)!
        rotationAnimation.springBounciness = 30
        rotationAnimation.toValue = NSNumber(value: .pi*random*0.1*(clockwise ? 1 : 0))
        rotationAnimation.completionBlock = { anim, finished in
            self.leafAnimation(leaf, clockwise: !clockwise)
        }
        leaf.layer.pop_add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    func showSnowAnimation() {
        let rect = CGRect(x: 0, y: -400, width: bounds.size.width, height: 50)
        let emitter = CAEmitterLayer()
        emitter.frame = rect
        layer.addSublayer(emitter)
        
        emitter.emitterShape = .rectangle
        emitter.emitterPosition = CGPoint(x: rect.size.width/2, y: rect.size.height/2)
        emitter.emitterSize = rect.size
        
        let cell = CAEmitterCell()
        cell.contents = #imageLiteral(resourceName: "snow").cgImage
        cell.birthRate = 30
        cell.lifetime = 80
        cell.lifetimeRange = 1
        cell.yAcceleration = 4.0
        cell.scale = 0.8
        cell.scaleRange = 0.2
        cell.scaleSpeed = -0.03
        cell.alphaRange = 0.1
        cell.alphaSpeed = -0.04
        
        emitter.emitterCells = [cell]
    }

}
