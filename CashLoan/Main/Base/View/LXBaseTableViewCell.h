//
//  LXBaseCell.h
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXBaseTableViewCell : UITableViewCell

@property (nonatomic, assign) NSInteger row;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
+ (instancetype)cellWithTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier;
- (void)configurationCell:(id)object;

@end
