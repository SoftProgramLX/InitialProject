//
//  LXBaseViewController.h
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LXNoDataView;

@interface LXBaseController : UIViewController

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, copy) NSMutableArray *dataArr;    //tableView的数据源
@property (nonatomic, assign) int currentPage;          //当前请求的页数
@property (nonatomic, weak) MBProgressHUD *hud;         //提示框
@property (nonatomic, weak) LXNoDataView *noDataView;   //无数据的特定界面
@property (nonatomic, copy) NSArray *noDataArr;         //无数据的特定界面的特定数据

- (void)addHud;
- (void)endRefreshing;
- (void)judgeShowNoDataView:(NSArray *)arr;

@end
