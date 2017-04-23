//
//  GuideView1.swift
//  StarrySky
//
//  Created by JaminZhou on 2017/4/16.
//  Copyright © 2017年 Hangzhou Tomorning Technology Co., Ltd. All rights reserved.
//

import UIKit

class GuideView1: UIView {
    
    let s1 = UIImageView()
    let s2 = UIImageView()
    let s3 = UIImageView()
    let s4 = UIImageView()
    let star0 = UIImageView(image: #imageLiteral(resourceName: "star2"))
    let star1 = UIImageView(image: #imageLiteral(resourceName: "star"))
    let star2 = UIImageView(image: #imageLiteral(resourceName: "star2"))
    let sc = UIImageView()
    
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
        addSView()
        addStarView()
        addSCView()
    }
    
    func showAnimation() {
        showSViewAnimation()
        showStarViewAnimation()
        showSCViewAnimation()
    }
    
    func addBack() {
        let back = UIImageView(frame: bounds)
        back.image = #imageLiteral(resourceName: "guide_back1")
        addSubview(back)
    }
    
    func addSView() {
        addSView(s1, named: "s1")
        addSView(s2, named: "s2")
        addSView(s3, named: "s3")
        addSView(s4, named: "s4")
        
        s2.alpha = 0.0
        s4.alpha = 0.0
    }
    
    func addSView(_ imageView:UIImageView, named: String) {
        imageView.frame = bounds
        imageView.image = UIImage(named: named)
        addSubview(imageView)
    }
    
    func showSViewAnimation() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut, .autoreverse, .repeat], animations: {
            self.s1.alpha = 0.0
            self.s3.alpha = 0.0
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut, .autoreverse, .repeat], animations: {
            self.s2.alpha = 1.0
            self.s4.alpha = 1.0
        }, completion: nil)
    }
    
    func addSCView() {
        sc.frame = CGRect(x: 0.2*frame.size.width, y: -0.2*frame.size.height, width: frame.size.width, height: frame.size.height)
        sc.image = #imageLiteral(resourceName: "sc")
        sc.alpha = 0.0
        addSubview(sc)
    }
    
    func showSCViewAnimation() {
        let dur = 0.5/12
        UIView.animateKeyframes(withDuration: 30.0, delay: 0.0, options: [.repeat, .calculationModeCubic], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: dur, animations: {
                self.sc.alpha = 1.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1.0-dur, relativeDuration: dur, animations: {
                self.sc.alpha = 0.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0, animations: {
                self.sc.transform = CGAffineTransform(rotationAngle: .pi*0.2)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0, animations: {
                self.sc.center.y = 0.1*self.frame.size.height
            })
        }, completion: nil)
    }
    
    func addStarView() {
        star0.alpha = 0.0
        star1.alpha = 0.0
        star2.alpha = 0.0
        addSubview(star0)
        addSubview(star1)
        addSubview(star2)
    }
    
    func showStarViewAnimation() {
        star0Aniamtion(delay: 0.5)
    }
    
    func star0Aniamtion(delay: Double) {
        star0.center = CGPoint(x: 0.9*frame.size.width, y: 0.05*frame.size.height)
        star0.alpha = 0.0
        let duration = 2.0
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5/duration, animations: {
                self.star0.alpha = 1.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1.0-0.5/duration, relativeDuration: 0.5/duration, animations: {
                self.star0.alpha = 0.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0, animations: {
                self.star0.center = CGPoint(x: -self.star0.frame.size.width/2, y: 0.45*self.frame.size.height)
            })
        }) { (finished) in
            self.star1Aniamtion(delay: 2.0)
        }
    }
    
    func star1Aniamtion(delay: Double) {
        star1.center = CGPoint(x: 0.7*frame.size.width, y: 0.12*frame.size.height)
        star1.alpha = 0.0
        let duration = 2.0
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5/duration, animations: {
                self.star1.alpha = 1.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0, animations: {
                self.star1.center = CGPoint(x: -self.star1.frame.size.width/2, y: 0.44*self.frame.size.height)
            })
        }) { (finished) in
            self.star2Aniamtion(delay: 3.0)
        }
    }
    
    func star2Aniamtion(delay: Double) {
        star2.center = CGPoint(x: frame.size.width+star2.frame.size.width/2, y: 0.25*frame.size.height)
        star2.alpha = 1.0
        let duration = 1.5
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 1.0-0.5/duration, relativeDuration: 0.5/duration, animations: {
                self.star2.alpha = 0.0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0, animations: {
                self.star2.center = CGPoint(x: 0.45*self.frame.size.width, y: 0.49*self.frame.size.height)
            })
        }) { (finished) in
            self.star0Aniamtion(delay: 1.0)
        }
    }
}
