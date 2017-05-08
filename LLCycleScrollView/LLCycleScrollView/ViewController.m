//
//  ViewController.m
//  LLCycleScrollView
//
//  Created by liushaohua on 2016/11/10.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "ViewController.h"
#import "LLCycleScrollView.h"

@interface ViewController ()<LLCycleScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *images = @[[UIImage imageNamed:@"1"],
                        [UIImage imageNamed:@"2"],
                        [UIImage imageNamed:@"3"],
                        [UIImage imageNamed:@"4"]
                        ];
    
    NSArray *imagesURLStrings = @[
                                  @"http://wx4.sinaimg.cn/mw1024/e67669aagy1ff02eyyt6gj20go0b4wg5.jpg",
                                  @"http://wx3.sinaimg.cn/mw1024/e67669aagy1ff02f11md6j20go0b6gns.jpg",
                                  @"http://wx1.sinaimg.cn/mw1024/e67669aagy1ff02f5up20j20go0bcjt3.jpg"
                                  ];

    
    NSArray *titles = @[@"本人拙作 感谢支持",
                        @"如有问题,欢迎提出",
                        @"您可以发邮件到17600207210@163.com",
                        @"谢谢"
                        ];
         
    CGFloat w = self.view.bounds.size.width;
    
    // 本地加载 --- 创建不带标题的图片轮播器
    LLCycleScrollView *cycleScrollView = [LLCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 100, w, 180) imagesGroup:images];
    
    cycleScrollView.infiniteLoop = YES;
    cycleScrollView.delegate = self;
    [self.view addSubview:cycleScrollView];
    //         --- 轮播时间间隔，默认1.0秒，可自定义
    
    //网络加载 --- 创建带标题的图片轮播器
    LLCycleScrollView *cycleScrollView2 = [LLCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 320, w, 180) imageURLsGroup:imagesURLStrings];
    cycleScrollView2.pageControlAliment = LLCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.delegate = self;
    cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.placeholderImage = [UIImage imageNamed:@"placeholder"];
    [self.view addSubview:cycleScrollView2];
    
    //             --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });
    
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(LLCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", index);
}

@end
