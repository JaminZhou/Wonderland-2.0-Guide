//
//  ViewController.swift
//  Wonderland-2.0-Guide
//
//  Created by JaminZhou on 2017/4/23.
//  Copyright © 2017年 Hangzhou Tomorning Technology Co., Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    var pagingScrollView: UIScrollView!
    var guide1: GuideView1!
    var guide2: GuideView2!
    var guide3: GuideView3!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPagingScrollView()
        addGuideView1()
        addGuideView2()
        addGuideView3()
        
        view.bringSubview(toFront: pagingScrollView)
        view.bringSubview(toFront: pageControl)
    }
    
    func addPagingScrollView() {
        pagingScrollView = UIScrollView(frame: view.bounds)
        pagingScrollView.contentSize = CGSize(width: view.bounds.width*3, height: view.bounds.height)
        pagingScrollView.showsHorizontalScrollIndicator = false
        pagingScrollView.isPagingEnabled = true
        pagingScrollView.delegate = self
        view.addSubview(pagingScrollView)
    }
    
    func addGuideView1() {
        guide1 = GuideView1(frame: view.bounds)
        guide1.showAnimation()
        view.addSubview(guide1)
    }
    
    func addGuideView2() {
        guide2 = GuideView2(frame: view.bounds)
        guide2.showAnimation()
        view.addSubview(guide2)
        
        guide2.alpha = 0.0
    }
    
    func addGuideView3() {
        guide3 = GuideView3(frame: view.bounds)
        guide3.showAnimation()
        view.addSubview(guide3)
        
        guide3.alpha = 0.0
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let width = view.bounds.width
        pageControl.currentPage = Int((offsetX+0.5*width)/width)
        
        if offsetX>=0 && offsetX<=width {
            guide2.alpha = offsetX/width
        } else if offsetX>width {
            guide2.alpha = 1.0
        } else {
            guide2.alpha = 0.0
        }
        
        if offsetX>=width && offsetX<=2*width {
            guide3.alpha = (offsetX-width)/width
        } else if offsetX>2*width {
            guide3.alpha = 1.0
        } else {
            guide3.alpha = 0.0
        }
    }
}

