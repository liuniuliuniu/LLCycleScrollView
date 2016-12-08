//
//  ViewController.m
//  图片轮播器
//
//  Created by liushaohua on 16/8/21.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "ZFBCycleCell.h"
#import "ZFBCycleFlowLayout.h"

#define imageCount 9
#define sectionCount 10
static NSString *cycleID = @"cycleID";
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, weak)UICollectionView *collectionView;
@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic, strong)UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setUI];
    [self setPageControl];
    [self addTimer];
    
}
- (void)setPageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.numberOfPages = imageCount;
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    pageControl.pageIndicatorTintColor = [UIColor darkGrayColor];
    [self.view addSubview:pageControl];
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.offset(-40);
    }];
    self.pageControl = pageControl;
}

- (void)setUI
{
    ZFBCycleFlowLayout *layout = [[ZFBCycleFlowLayout alloc]init];
    UICollectionView *collectionVIew = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.view addSubview:collectionVIew];
    [collectionVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(300);
    }];
    collectionVIew.pagingEnabled = YES;
    collectionVIew.dataSource = self;
    collectionVIew.delegate = self;
    collectionVIew.showsVerticalScrollIndicator = NO;
    collectionVIew.showsHorizontalScrollIndicator = NO;
    collectionVIew.bounces = NO;
    [collectionVIew registerClass:[ZFBCycleCell class] forCellWithReuseIdentifier:cycleID];
    self.collectionView = collectionVIew;
    
    // 由于collectionView  的frame  视图刚开始没有frame 是通过约束设置的  所以要更新一下约束
    [self.view layoutIfNeeded];

    //求出中间哪一组的index
    NSIndexPath *index = [NSIndexPath indexPathForItem:0 inSection:sectionCount/2];
    //让视图滚到中间的视图
    [collectionVIew scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 350, 375, 200)];
    [self.view addSubview:tableView];
}
- (void)addTimer{
    self.timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    // 把定时器添加到运行循环 改变它的执行模式为通用模式
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];


}


- (void)nextPage
{
    NSInteger page = self.pageControl.currentPage;
    NSIndexPath *scrollToPath = nil;
    if (page == imageCount - 1) {
        scrollToPath = [NSIndexPath indexPathForItem:0 inSection:sectionCount * 0.5 +1];
    }else{
        scrollToPath = [NSIndexPath indexPathForItem:page + 1 inSection:sectionCount * 0.5];
    }
    [self.collectionView scrollToItemAtIndexPath:scrollToPath atScrollPosition:  UICollectionViewScrollPositionLeft  animated:YES];

}
    //  手动调用之后 让定时器执行时间在很遥远的未来
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.timer.fireDate = [NSDate distantFuture];
}

    // 当用户停止拖拽之后2秒之后再开始执行定时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:2];

}
    // 用代码动画方式滚动,滚动一页动画停下来后会调用此方法"主要判断如果走到非中间组就让它无动画效果的回到中间这一组"
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self scrollViewDidEndDecelerating:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //算出指示器
    NSInteger page = scrollView.contentOffset.x/self.view.bounds.size.width +0.499;
    NSLog(@"%zd",page);
    //安全处理不要越界
    NSInteger pageNum = page % imageCount;
    self.pageControl.currentPage = pageNum;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x/self.view.bounds.size.width;
    NSInteger section = page/imageCount;
        NSInteger item = page%imageCount;
    if (section == sectionCount /2) {
        NSLog(@"我在中间呢");
        return;
    }
    //求出中间哪一组的index
    NSIndexPath *index = [NSIndexPath indexPathForItem:item inSection:sectionCount/2];
    //让视图滚到中间的视图
    [self.collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
}
#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return sectionCount;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return imageCount;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZFBCycleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cycleID forIndexPath:indexPath];
    cell.indexPath = indexPath;
    return cell;
}

@end
