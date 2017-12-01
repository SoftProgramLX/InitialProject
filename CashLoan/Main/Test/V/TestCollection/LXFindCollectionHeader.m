//
//  LXFindCollectionHeader.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXFindCollectionHeader.h"

@implementation LXFindCollectionHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - 44, 5, 44)];
        colorView.backgroundColor = kBlueFontColor;
        [self addSubview:colorView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(12, colorView.y, kScreenWidth, colorView.height)];
        label.font = [UIFont systemFontOfSize:18];
        label.textColor = kBlackFontColor;
        [self addSubview:label];
        self.titleLaber = label;
        
        UIView *hline = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height, frame.size.width, 0.5)];
        hline.backgroundColor = kLineColor;
        [self addSubview:hline];
    }
    
    return self;
}

- (void)configurationHeaderView:(NSString *)objectStr
{
    self.titleLaber.text = objectStr;
}

@end
