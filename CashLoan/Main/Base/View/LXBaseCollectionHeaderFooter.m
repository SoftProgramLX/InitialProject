//
//  LXBaseCollectionHeaderView.m
//  CashLoan
//
//  Created by lixu on 2017/11/30.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import "LXBaseCollectionHeaderFooter.h"

@implementation LXBaseCollectionHeaderFooter

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kCellBackGroundColor;
    }
    
    return self;
}

- (void)configurationHeaderView:(id)model
{

}

@end
