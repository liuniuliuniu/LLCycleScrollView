//
//  LLCollectionViewCell.h
//  LLCycleScrollView
//
//  Created by liushaohua on 2016/11/10.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) UIImageView *imageView;
@property (copy, nonatomic) NSString *title;


@property (nonatomic, strong) UIColor *titleLabelTextColor;
@property (nonatomic, strong) UIFont *titleLabelTextFont;
@property (nonatomic, strong) UIColor *titleLabelBackgroundColor;
@property (nonatomic, assign) CGFloat titleLabelHeight;

@property (nonatomic, assign) BOOL hasConfigured;


@end
