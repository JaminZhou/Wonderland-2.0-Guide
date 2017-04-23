//
//  GuideView3.swift
//  Wonderland-2.0-Guide
//
//  Created by JaminZhou on 2017/4/23.
//  Copyright © 2017年 Hangzhou Tomorning Technology Co., Ltd. All rights reserved.
//

import UIKit
import pop

class GuideView3: UIView {
    
    let cloud0 = UIImageView()
    let cloud1 = UIImageView()

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
        addCloud()
    }
    
    func showAnimation() {
        showCloudAnimation()
        showWindmillAnimation()
    }
    
    func addBack() {
        let back = UIImageView(frame: bounds)
        back.image = #imageLiteral(resourceName: "guide_back3")
        addSubview(back)
    }
    
    func addCloud() {
        let ratio = bounds.size.width/375
        let cloudImage = #imageLiteral(resourceName: "cloud")
        let imageWidth = cloudImage.size.width*ratio
        
        cloud0.frame = CGRect(x: 0, y: 0, width: imageWidth, height: bounds.size.height)
        cloud1.frame = CGRect(x: imageWidth, y: 0, width: imageWidth, height: bounds.size.height)
        cloud0.image = cloudImage
        cloud1.image = cloudImage
        insertSubview(cloud0, at: 0)
        insertSubview(cloud1, at: 0)
    }
    
    func showCloudAnimation() {
        cloudAnimation(cloud0)
        cloudAnimation(cloud1)
    }
    
    func cloudAnimation(_ cloud: UIView) {
        let width = cloud.frame.size.width
        let originX = cloud.frame.origin.x
        var rect = cloud.frame
        rect.origin.x = originX-width
        UIView.animate(withDuration: TimeInterval(width/9), delay: 0.0, options: [.curveLinear,.repeat], animations: {
            cloud.frame = rect
        }) { (finished) in
            
        }
    }
    
    func showWindmillAnimation() {
        let ratio = bounds.size.width/375
        let windmill = UIImageView(image: #imageLiteral(resourceName: "windmill"))
        windmill.center = CGPoint(x: 95.5*ratio, y: 524*ratio)
        windmill.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
        addSubview(windmill)
        
        windmillAnimation(windmill)
    }
    
    func  windmillAnimation(_ view: UIView) {
        let random = (Double(arc4random()%10)+1)/10.0
        
        let rotationAnimation = POPBasicAnimation(propertyNamed: kPOPLayerRotation)!
        rotationAnimation.toValue = NSNumber(value: .pi*2.0)
        rotationAnimation.duration = 6+4*random
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        rotationAnimation.completionBlock = { anim, finished in
            self.windmillAnimation(view)
        }
        view.layer.pop_add(rotationAnimation, forKey: "rotationAnimation")
    }
    
}
