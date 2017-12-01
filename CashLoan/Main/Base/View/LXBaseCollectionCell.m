//
//  LXBaseCollectionCell.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXBaseCollectionCell.h"

@implementation LXBaseCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kCellBackGroundColor;
    }
    return self;
}

- (void)configurationCell:(id)object
{

}

@end
