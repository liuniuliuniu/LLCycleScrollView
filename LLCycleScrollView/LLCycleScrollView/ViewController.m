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
    self.view.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:0.99];
    NSArray *images = @[[UIImage imageNamed:@"1"],
                        [UIImage imageNamed:@"2"],
                        [UIImage imageNamed:@"3"],
                        [UIImage imageNamed:@"4"]
                        ];
    
    NSArray *titles = @[@"感谢您的支持，如果下载的",
                        @"如果代码在使用过程中出现问题",
                        @"您可以发邮件到gsdios@126.com",
                        @"感谢您的支持"
                        ];
    
    
    CGFloat w = self.view.bounds.size.width;
    
    // 创建不带标题的图片轮播器
    LLCycleScrollView *cycleScrollView = [LLCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 60, w, 180) imagesGroup:images];
    cycleScrollView.delegate = self;
    [self.view addSubview:cycleScrollView];
    
    
    // 创建带标题的图片轮播器
    LLCycleScrollView *cycleScrollView2 = [LLCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 280, w, 180) imagesGroup:images];
    cycleScrollView2.pageControlAliment = LLCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.delegate = self;
    cycleScrollView2.titlesGroup = titles;
    [self.view addSubview:cycleScrollView2];
    
    
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(LLCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", index);
}

@end
