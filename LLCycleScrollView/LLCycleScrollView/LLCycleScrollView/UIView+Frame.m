//
//  UIView+Frame.m
//  LLCycleScrollView
//
//  Created by liushaohua on 2016/8/3.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat)left
{
    return self.frame.origin.x;
}
- (void)setLeft:(CGFloat)left
{
    self.frame = CGRectMake(left, self.top, self.frame.size.width, self.frame.size.height);
}
- (CGFloat)top
{
    return self.frame.origin.y;
}
- (void)setTop:(CGFloat)top
{
    self.frame = CGRectMake(self.left, top, self.frame.size.width, self.frame.size.height);
}
- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setRight:(CGFloat)right
{
    self.frame = CGRectMake(self.left, self.top, right - self.left, self.frame.size.height);
}
- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setBottom:(CGFloat)bottom
{
    self.frame = CGRectMake(self.left, self.top, self.frame.size.width, bottom - self.top);
}
- (CGFloat)width
{
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width
{
    self.frame = CGRectMake(self.left, self.top, width, self.height);
}
- (CGFloat)height
{
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height
{
    self.frame = CGRectMake(self.left, self.top, self.width, height);
}

@end
