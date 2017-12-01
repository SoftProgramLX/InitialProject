//
//  LXBaseViewController.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXBaseController.h"

@interface LXBaseController () <LXNoDataViewDelegate>

@end

@implementation LXBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    _currentPage = 0;
    _dataArr = [NSMutableArray array];
    self.view.backgroundColor = kBackGroundColor;
}

- (void)dealloc
{
    NSLog(@"%@", self);
}

- (void)addHud
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
    hud.label.text = @"加载中...";
    [self.view addSubview:hud];
    self.hud = hud;
}

- (void)endRefreshing
{
    if (self.tableView.mj_header) {
        [self.tableView.mj_header endRefreshing];
    }
    if (self.tableView.mj_footer) {
        [self.tableView.mj_footer endRefreshing];
    }
    if (self.hud) {
        [self.hud hideAnimated:YES];
    }
}

- (void)judgeShowNoDataView:(NSArray *)arr
{
    if (arr && arr.count > 0) {
        if (self.noDataView) {
            [self.noDataView removeFromSuperview];
            self.noDataView = nil;
            
            self.tableView.hidden = NO;
        }
    } else {
        if (!self.noDataView) {
            self.tableView.hidden = YES;
            
            LXNoDataView *noDataView = [[LXNoDataView alloc] initWithData:self.noDataArr];
            noDataView.delegate = self;
            [self.view addSubview:noDataView];
            self.noDataView = noDataView;
        }
    }
}

- (void)noDataBtnClickedDelegate
{
    
}

@end
