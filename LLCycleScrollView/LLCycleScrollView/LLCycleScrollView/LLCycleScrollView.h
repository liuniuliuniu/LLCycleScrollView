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

@property (nonatomic, strong) NSArray *imagesGroup;
@property (nonatomic, strong) NSArray *titlesGroup;
@property (nonatomic, assign) LLCycleScrollViewPageContolAliment pageControlAliment;
@property (nonatomic, weak) id<LLCycleScrollViewDelegate> delegate;

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame imagesGroup:(NSArray *)imagesGroup;


@end
