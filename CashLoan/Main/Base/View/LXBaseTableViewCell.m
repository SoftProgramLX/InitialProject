//
//  LXBaseCell.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXBaseTableViewCell.h"

@implementation LXBaseTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    return [self cellWithTableView:tableView reuseIdentifier:NSStringFromClass([self class])];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier
{
    LXBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = kCellBackGroundColor;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
//        self.selectedBackgroundView = [[UIView alloc] init];
//        self.selectedBackgroundView.backgroundColor = globalRedColor;
    }
    return self;
}

- (void)configurationCell:(id)object
{

}

@end
