//
//  LXTestRequestFrames.m
//  CashLoan
//
//  Created by lixu on 2017/11/30.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import "LXTestTabletFrames.h"

@implementation LXTestTabletFrames

- (void)setModel:(LXDoubanUserUsers *)model
{
    _model = model;
    
    self.imageVFrame = CGRectMake(kScreenGapNormal, 10, 40, 40);
    CGFloat nameLabelX = self.imageVFrame.origin.x + self.imageVFrame.size.width + 8;
    self.nameLabelFrame = CGRectMake(nameLabelX, self.imageVFrame.origin.y, kScreenWidth - nameLabelX - kScreenGapNormal, 16);
    CGFloat descLabelY = self.nameLabelFrame.origin.y + self.nameLabelFrame.size.height + 5;
    CGFloat descLabelH = [LXDataHelpClass calculateLabelHeighWithText:model.desc withMaxSize:CGSizeMake(self.nameLabelFrame.size.width, MAXFLOAT) withFont:14];
    self.descLabelFrame = CGRectMake(nameLabelX, descLabelY, self.nameLabelFrame.size.width, descLabelH);
    
    self.cellHeight = self.descLabelFrame.origin.y + self.descLabelFrame.size.height + 12;
}

@end
