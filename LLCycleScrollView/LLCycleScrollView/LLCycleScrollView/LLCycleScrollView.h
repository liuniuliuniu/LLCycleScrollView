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
/**图片数组*/
@property (nonatomic, strong) NSArray *imagesGroup;
/**文字标题数组*/
@property (nonatomic, strong) NSArray *titlesGroup;
/**时间间隔*/
@property (nonatomic, assign) CGFloat autoScrollTimeInterval;
/**指示器的位置*/
@property (nonatomic, assign) LLCycleScrollViewPageContolAliment pageControlAliment;
@property (nonatomic, weak) id<LLCycleScrollViewDelegate> delegate;

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame imagesGroup:(NSArray *)imagesGroup;


@end
