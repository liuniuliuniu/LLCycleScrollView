//
//  ViewController.swift
//  LLCycleScrollViewDemo
//
//  Created by 奥卡姆 on 2017/10/11.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:网络图片
        let imagesURLStrings = [
                                "http://wx4.sinaimg.cn/mw1024/e67669aagy1ff02eyyt6gj20go0b4wg5.jpg",
                                "http://wx3.sinaimg.cn/mw1024/e67669aagy1ff02f11md6j20go0b6gns.jpg",                                
                                "http://wx1.sinaimg.cn/mw1024/e67669aagy1ff02f5up20j20go0bcjt3.jpg",
                                ]
        let titles = ["Swift 图片轮播",
                      "感谢支持",
                      "欢迎 issue"]
        let cycleScrollView = LLCycleScrollView.cycleScrollView(frame: CGRect.init(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: 280), imageURLGroup: imagesURLStrings as NSArray)
        cycleScrollView.titlesGroup = titles as NSArray
        cycleScrollView.callBackWithIndex = { (index : Int) in
            print("当前网络图片 Index:\(index)")
        }        
        view.addSubview(cycleScrollView)
        
        //MARK:本地图片
        let imageStrings = [UIImage.init(named: "1"),
                           UIImage.init(named: "2"),
                           UIImage.init(named: "3")]
        let titles2 = ["周冬雨",
                       "我最酷",
                       "我最美"]
        let cycleScrollView2 = LLCycleScrollView.cycleScrollView(frame: CGRect.init(x: 0, y: 400, width: UIScreen.main.bounds.size.width, height: 280), imagesGroup: imageStrings as NSArray)
        cycleScrollView2.titlesGroup = titles2 as NSArray
        view.addSubview(cycleScrollView2)
        cycleScrollView2.delegate = self
        // 个性化定制 更多自定义设置参考源码
        cycleScrollView2.pageControlAliment = LLCycleScrollViewPageContolAliment.LLCycleScrollViewPageContolAlimentRight
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: LLCycleScrollViewDelagate{
    
    func LLCycleScrollViewImageSelectedIndex(index: Int) {
        print("本地图片的 Index: \(index)")
    }
    
}

