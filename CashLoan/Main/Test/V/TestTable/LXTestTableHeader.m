//
//  LXTestTableHeaderView.m
//  CashLoan
//
//  Created by lixu on 2017/11/30.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import "LXTestTableHeader.h"

@interface LXTestTableHeader ()

@property (nonatomic, weak) UILabel *titleLabel;

@end

@implementation LXTestTableHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kCellBackGroundColor;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenGapNormal, 0, kScreenWidth - 2*kScreenGapNormal, 40)];
        titleLabel.textColor = kGrayFontColor;
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
    }
    return self;
}

- (void)configurationHeaderView:(NSString *)page
{
    self.titleLabel.text = [NSString stringWithFormat:@"这是section的header 第%@页", page];
}

@end
