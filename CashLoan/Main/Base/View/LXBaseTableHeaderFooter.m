//
//  LXBaseTableHeaderView.m
//  CashLoan
//
//  Created by lixu on 2017/11/30.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import "LXBaseTableHeaderFooter.h"

@implementation LXBaseTableHeaderFooter

+ (instancetype)headerViewWithTableView:(UITableView *)tableView
{
    return [self headerViewWithTableView:tableView reuseIdentifier:NSStringFromClass([self class])];
}
+ (instancetype)headerViewWithTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier
{
    LXBaseTableHeaderFooter *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseIdentifier];
    if (headerView == nil) {
        headerView = [[self alloc] initWithReuseIdentifier:reuseIdentifier];
    }
    return headerView;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kCellBackGroundColor;
    }
    return self;
}

- (void)configurationHeaderView:(id)model
{

}

@end
