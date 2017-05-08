//
//  LLCycleScrollView.h
//  LLCycleScrollView
//
//  Created by liushaohua on 2016/11/10.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    LLCycleScrollViewPageContolAlimentRight,
    LLCycleScrollViewPageContolAlimentCenter
} LLCycleScrollViewPageContolAliment;

@class LLCycleScrollView;

@protocol LLCycleScrollViewDelegate <NSObject>

- (void)cycleScrollView:(LLCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;

@end


@interface LLCycleScrollView : UIView



// 本地图片数组
@property (nonatomic, strong) NSArray *localizationImagesGroup;

// 网络图片 url string 数组
@property (nonatomic, strong) NSArray *imageURLStringsGroup;


/**文字标题数组*/
@property (nonatomic, strong) NSArray *titlesGroup;
/**时间间隔*/
@property (nonatomic, assign) CGFloat autoScrollTimeInterval;


/**是否无限循环,默认Yes*/
@property(nonatomic,assign) BOOL infiniteLoop;

/**是否自动滚动,默认Yes*/
@property(nonatomic,assign) BOOL autoScroll;

/** 是否在只有一张图时隐藏pagecontrol，默认为YES*/
@property(nonatomic) BOOL hidesForSinglePage;

// 占位图，用于网络未加载到图片时
@property (nonatomic, strong) UIImage *placeholderImage;


/**指示器的位置*/
@property (nonatomic, assign) LLCycleScrollViewPageContolAliment pageControlAliment;

/** 是否显示分页控件*/
@property (nonatomic, assign) BOOL showPageControl;


/** 分页控件小圆标颜色*/
@property (nonatomic, strong) UIColor *dotColor;

@property (nonatomic, strong) UIColor *titleLabelTextColor;
@property (nonatomic, strong) UIFont  *titleLabelTextFont;
@property (nonatomic, strong) UIColor *titleLabelBackgroundColor;
@property (nonatomic, assign) CGFloat titleLabelHeight;



@property (nonatomic, weak) id<LLCycleScrollViewDelegate> delegate;

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame imagesGroup:(NSArray *)imagesGroup;

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame imageURLsGroup:(NSArray *)imageURLsGroup;












@end
