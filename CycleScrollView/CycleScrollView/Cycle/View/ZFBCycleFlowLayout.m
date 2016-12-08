//
//  ZFBCycleFlowLayout.m
//  图片轮播器
//
//  Created by liushaohua on 16/8/21.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "ZFBCycleFlowLayout.h"

@implementation ZFBCycleFlowLayout

-(void)prepareLayout
{
    [super prepareLayout];
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

@end
