//
//  LXFindController.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXTestCollectionController.h"
#import "LXHotCollectionViewCell.h"
#import "LXDestinationCollectionCell.h"
#import "LXExpertCollectionCell.h"
#import "LXFindCollectionHeader.h"
#import "LXDoubanBookResponse.h"

static NSString *kExpertCollectionCell       = @"LXExpertCollectionCell";
static NSString *kDestinationCollectionCell  = @"LXDestinationCollectionCell";
static NSString *kHotCollectionViewCell      = @"LXHotCollectionViewCell";
static NSString *kFindCollectionHeader       = @"LXFindCollectionHeader";
static NSString *kFindCollectionFooter       = @"LXBaseCollectionHeaderFooter";

@interface LXTestCollectionController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak)   UICollectionView * collectionView;
@property (nonatomic, copy)   NSArray *headertitleArr;

@end

@implementation LXTestCollectionController

#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.titleStr = @"TestCollection";
    [self createUI];
    [self addHud];
    [self loadNetData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [LXUIHelpClass toastWithBrokenNet];
}

#pragma mark - Loading data

- (void)loadNetData
{
    [self.hud showAnimated:YES];
    [LXHttpRequest get:@"https://api.douban.com/v2/book/1220562" param:nil success:^(id responseObj) {
        [self.hud hideAnimated:YES];
        LXDoubanBookResponse *response = [LXDoubanBookResponse mj_objectWithKeyValues:responseObj];
        NSLog(@"%@", response.tags[0].name);
    } failure:^(NSError *error) {
        [self.hud hideAnimated:YES];
    }];
    
    [self.dataArr setArray:@[
                            @[@[@"head", @"奔月的胖子", @"三亚：我只愿面朝\n大海，春暖花开"], @[@"head2", @"左左xians", @"西行记｜浪在西藏\n的最后一个暑假"], @[@"head3", @"雍荣makiori", @"九寨沟：我与斑斓的世界有个约会"]],
                            @[@[@"japan", @"日本", @"Japan"], @[@"NewZealand", @"新西兰", @"NewZealand"], @[@"Maldives", @"马尔大夫", @"Maldives"], @[@"yunnan", @"云南", @"Yunnan"], @[@"tibet", @"西藏", @"Tibet"], @[@"xinjiang", @"新疆", @"Xinjiang"]],
                            @[@[@"banner1", @"关注女儿童生理健康", @"每月20元资助一个贫困女生卫生用品，让孩子远离痛苦！"], @[@"banner2", @"关爱儿童", @"关爱儿童，让孩子远离痛苦！"]]]];
    
    _headertitleArr = @[@"推荐行家", @"推荐目的地", @"热门公益"];
}

#pragma mark - Create view

- (void)createUI
{
    UICollectionViewFlowLayout * flow = [[UICollectionViewFlowLayout alloc] init];
    flow.scrollDirection =UICollectionViewScrollDirectionVertical;
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kScreenViewY, kScreenWidth, kScreenHeight - kScreenViewY) collectionViewLayout:flow];
    collection.bounces = YES;
    collection.backgroundColor = kCellBackGroundColor;
    collection.delegate = self;
    collection.dataSource = self;
    [collection registerClass:NSClassFromString(kExpertCollectionCell) forCellWithReuseIdentifier:kExpertCollectionCell];
    [collection registerClass:NSClassFromString(kDestinationCollectionCell) forCellWithReuseIdentifier:kDestinationCollectionCell];
    [collection registerClass:NSClassFromString(kHotCollectionViewCell) forCellWithReuseIdentifier:kHotCollectionViewCell];
    [collection registerClass:NSClassFromString(kFindCollectionHeader) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kFindCollectionHeader];
    [collection registerClass:NSClassFromString(kFindCollectionFooter)  forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kFindCollectionFooter];
    [self.view addSubview:collection];
    self.collectionView = collection;
}

#pragma mark - UICollectionViewDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0: {
            LXExpertCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kExpertCollectionCell forIndexPath:indexPath];
            [cell configurationCell:self.dataArr[indexPath.section][indexPath.row]];
            return cell;
        } break;
            
        case 1: {
            LXDestinationCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kDestinationCollectionCell forIndexPath:indexPath];
            [cell configurationCell:self.dataArr[indexPath.section][indexPath.row]];
            return cell;
        } break;
            
        default: {
            LXHotCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kHotCollectionViewCell forIndexPath:indexPath];
            cell.backgroundColor = [UIColor yellowColor];
            [cell configurationCell:self.dataArr[indexPath.section][indexPath.row]];
            return cell;
        } break;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [(NSArray *)self.dataArr[section] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArr.count;
}

//cell间的最大间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    switch (section) {
        case 0: {
            return UIEdgeInsetsMake(0.5, 0, 0.5, 0.5);
        } break;
            
        case 1: {
            return UIEdgeInsetsMake(10, kScreenGapMin, 10, kScreenGapMin);
        } break;
            
        default: {
            return UIEdgeInsetsMake(10, kScreenGapMin, 10, kScreenGapMin);
        } break;
    }
}

//cell的宽高值
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0: {
            CGFloat cellWidth = (kScreenWidth - 0.5*2)/3.0;
            return CGSizeMake(cellWidth, 120);
        } break;
            
        case 1: {
            CGFloat cellWidth = (kScreenWidth - kScreenGapMin*2 - 5*2)/3.0;
            return CGSizeMake(cellWidth, cellWidth+37);
        } break;
            
        default: {
            return CGSizeMake(kScreenWidth - kScreenGapMin*2, 141);
        } break;
    }
}

//cell间最小横向间隙
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    switch (section) {
        case 0: {
            return 0.5;
        } break;
            
        case 1: {
            return 10;
        } break;
            
        default: {
            return 10;
        } break;
    }
}

//cell间最小纵向间隙
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    switch (section) {
        case 0: {
            return 0;//cell与屏幕边界的间距值是0，即是最小值
        } break;
            
        case 1: {
            return 5.0;
        } break;
            
        default: {
            return kScreenGapMin;
        } break;
    }
}

//设置标头和标尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        LXFindCollectionHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kFindCollectionHeader forIndexPath:indexPath];
        [headerView configurationHeaderView:self.headertitleArr[indexPath.section]];
        return headerView;
    } else {
        LXBaseCollectionHeaderFooter *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kFindCollectionFooter forIndexPath:indexPath];
        return footerView;
    }
}

//设置镖头的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(kScreenWidth, 44);
}

//设置彪尾的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        return CGSizeMake(kScreenWidth, 0);
    }
    
    return CGSizeMake(kScreenWidth, 10);
}

#pragma mark - SystemDelegate
#pragma mark - CustomDelegate
#pragma mark - Observer
#pragma mark - Event response
#pragma mark - Private methods
#pragma mark - Setter and getter

@end
