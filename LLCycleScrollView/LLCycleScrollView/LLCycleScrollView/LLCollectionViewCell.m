//
//  LLCollectionViewCell.m
//  LLCycleScrollView
//
//  Created by liushaohua on 2016/11/10.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "LLCollectionViewCell.h"
#import "UIView+Frame.h"

@implementation LLCollectionViewCell
{
    __weak UILabel *_titleLabel;
}



- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc] init];
        _imageView = imageView;
        [self addSubview:imageView];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        _titleLabel = titleLabel;
        _titleLabel.hidden = YES;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:titleLabel];
    }
    
    return self;
}

- (void)setTitle:(NSString *)title
{
    _title = [title copy];
    _titleLabel.text = [NSString stringWithFormat:@"   %@", title];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _imageView.frame = self.bounds;
    
    CGFloat titleLabelW = self.width;
    CGFloat titleLabelH = 30;
    CGFloat titleLabelX = 0;
    CGFloat titleLabelY = self.height - titleLabelH;
    _titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
    _titleLabel.hidden = !_titleLabel.text;
}




@end
