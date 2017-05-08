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
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
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
