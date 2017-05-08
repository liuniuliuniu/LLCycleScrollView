//
//  UIView+Frame.h
//  LLCycleScrollView
//
//  Created by liushaohua on 2016/8/3.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

- (CGFloat)left;
- (CGFloat)top;
- (CGFloat)right;
- (CGFloat)bottom;
- (CGFloat)width;
- (CGFloat)height;
- (void)setLeft:(CGFloat)left;
- (void)setTop:(CGFloat)top;
- (void)setRight:(CGFloat)right;
- (void)setBottom:(CGFloat)bottom;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;

@end
