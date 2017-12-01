//
//  LXBaseTableHeaderView.h
//  CashLoan
//
//  Created by lixu on 2017/11/30.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXBaseTableHeaderFooter : UITableViewHeaderFooterView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;
+ (instancetype)headerViewWithTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier;
- (void)configurationHeaderView:(id)model;

@end
