# Swift's LLCycleScrollView


![LLCycleScrollView](https://github.com/liuniuliuniu/LLCycleScrollView/blob/master/LLCycleScrollView.gif)

### 如何添加

手动添加

* 1 需要 导入第三方`pod 'Kingfisher', '4.0.0'`
* 2 把 LLCycleScrollView.swift 文件拖入到项目中即可

###基本使用方法
**更多自定义属性可参考项目中的 demo**

```

        //MARK:网络图片
        let imagesURLStrings = [
                                "http://wx4.sinaimg.cn/mw1024/e67669aagy1ff02eyyt6gj20go0b4wg5.jpg",
                                "http://wx3.sinaimg.cn/mw1024/e67669aagy1ff02f11md6j20go0b6gns.jpg",                                
                                "http://wx1.sinaimg.cn/mw1024/e67669aagy1ff02f5up20j20go0bcjt3.jpg",
                                ]
	   //MARK:标题数组
        let titles = ["Swift 图片轮播",
                      "感谢支持",
                      "欢迎 issue"]
                      
        let cycleScrollView = LLCycleScrollView.cycleScrollView(frame: CGRect.init(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: 280), imageURLGroup: imagesURLStrings as NSArray)
        cycleScrollView.titlesGroup = titles as NSArray
        
        cycleScrollView.callBackWithIndex = { (index : Int) in
            print("当前网络图片 Index:\(index)")
        }        
        view.addSubview(cycleScrollView)
        
        ****
```

###Hope

* 代码使用过程中，发现任何问题，可以随时issue
* 如果有更多建议或者想法也可以直接联系我 QQ:416997919

