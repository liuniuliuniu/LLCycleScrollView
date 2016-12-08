//
//  ZFBCycleCell.m
//  图片轮播器
//
//  Created by liushaohua on 16/8/21.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "ZFBCycleCell.h"
#import "Masonry.h"

@interface ZFBCycleCell ()

@property (nonatomic, weak)UIImageView *iconView;
@property (nonatomic, weak)UILabel *indexLable;

@end

@implementation ZFBCycleCell
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    // 添加cell中的广告图片
    UIImageView *iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:iconView];
    
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    UILabel *indexLabel = [[UILabel alloc] init];
    indexLabel.font = [UIFont systemFontOfSize:30];
    indexLabel.textAlignment = NSTextAlignmentCenter;
    indexLabel.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:indexLabel];
    
    [indexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
    }];
    //属性赋值
    self.iconView = iconView;
    self.indexLable = indexLabel;
}
- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    self.iconView.image = [UIImage imageNamed:@(indexPath.item).description];
    self.indexLable.text = [NSString stringWithFormat:@"第%zd组，第%zd个",indexPath.section,indexPath.item];
}

@end
