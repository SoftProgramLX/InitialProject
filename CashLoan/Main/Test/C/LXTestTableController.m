//
//  LXTestRequestController.m
//  CashLoan
//
//  Created by lixu on 2017/11/29.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import "LXTestTableController.h"
#import "LXDoubanUserResponse.h"
#import "LXDoubanBookResponse.h"
#import "LXTestTableViewCell.h"
#import "LXTestTableHeader.h"
#import "LXTestTabletFrames.h"

#define userNetDataCount 2

@interface LXTestTableController () <UITableViewDelegate, UITableViewDataSource>
{
    BOOL isRequesting;  //防止同时上下拉导致数据混乱
}
@end

@implementation LXTestTableController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self createView];
    [self addTableViewRefresh];
    [self addHud];
    [self.tableView.mj_header beginRefreshing]; //[self loadNetData];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [LXUIHelpClass toast:@"这是提示框样式"];
    [JPUSHService stopLogPageView:@"测试Table页面"];
    [super viewDidDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [JPUSHService startLogPageView:@"测试Table页面"];
}

#pragma mark - Loading data

- (void)initData
{
    isRequesting = NO;
    self.titleStr = @"TestRequest";
    self.noDataArr = @[@"tibet.png", @"为找到符合您要求的产品", @"恢复"];
}

- (void)loadNetDataWithPage:(int)page
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"q"] = @"iOS";
    parameters[@"count"] = kIntToString(userNetDataCount);
    parameters[@"start"] = kIntToString((page-1)*userNetDataCount);
    NSString *urlStr = @"https://api.douban.com/v2/user";
    
    [self.hud showAnimated:YES];
    kWeakSelf(self);
    [LXHttpRequest get:urlStr param:parameters success:^(id responseObj) {
        [weakself endRefreshing];
        
        LXDoubanUserResponse *response = [LXDoubanUserResponse mj_objectWithKeyValues:responseObj];
        
        //模拟数据加载完成与无数据的效果
        if (rand()%100 < 50) {
            response.users = nil;
        }
        
        //下拉刷新
        if (page == 1) {
            [weakself.dataArr removeAllObjects];
            //若无数据则需显示指定页面
            [self judgeShowNoDataView:response.users];
        }
        
        if (response.users && response.users.count > 0) {
            [weakself.dataArr addObjectsFromArray:[self setSubviewsFrameWithDataArr:response.users]];
        } else {
            [weakself.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        
        [weakself.tableView reloadData];
        isRequesting = NO;
    } failure:^(NSError *error) {
        [weakself endRefreshing];
        isRequesting = NO;
    }];
}

#pragma mark - Create view

- (void)createView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kScreenViewY, kScreenWidth, kScreenHeight - kScreenViewY) style:UITableViewStyleGrouped];
    tableView.backgroundColor = kBackGroundColor;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (void)addTableViewRefresh
{
    kWeakSelf(self);
    self.tableView.mj_header=  [MJRefreshStateHeader headerWithRefreshingBlock:^{
        if (!isRequesting) {
            isRequesting = YES;
            weakself.currentPage = 1;
            [weakself loadNetDataWithPage:1];
        }
    }];
    self.tableView.mj_footer= [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
        if (!isRequesting) {
            isRequesting = YES;
            weakself.currentPage++;
            [weakself loadNetDataWithPage:weakself.currentPage];
        }
    }];
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LXTestTableViewCell *cell = [LXTestTableViewCell cellWithTableView:tableView];
    [cell configurationCell:self.dataArr[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LXTestTabletFrames *frame = self.dataArr[indexPath.row];
    return frame.cellHeight;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    LXTestTableHeader *headerView = [LXTestTableHeader headerViewWithTableView:tableView];
    [headerView configurationHeaderView:kIntToString(self.currentPage)];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    LXBaseTableHeaderFooter *footerView = [LXBaseTableHeaderFooter headerViewWithTableView:tableView reuseIdentifier:@"LXBaseTableHeaderFooter"];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

#pragma mark - SystemDelegate
#pragma mark - CustomDelegate

- (void)noDataBtnClickedDelegate
{
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - Observer
#pragma mark - Event response
#pragma mark - Private methods

- (NSArray *)setSubviewsFrameWithDataArr:(NSArray *)arr
{
    NSMutableArray *tempArr = [NSMutableArray array];
    for (LXDoubanUserUsers *model in arr) {
        LXTestTabletFrames *frame = [[LXTestTabletFrames alloc] init];
        //通过重写setModel方法计算设置cell内部自定义控件的布局
        frame.model = model;
        [tempArr addObject:frame];
    }
    return tempArr;
}

#pragma mark - Setter and getter

@end
