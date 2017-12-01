//
//  LXTestRequestFrames.h
//  CashLoan
//
//  Created by lixu on 2017/11/30.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXDoubanUserUsers.h"

@interface LXTestTabletFrames : NSObject

//数据源
@property (nonatomic, strong) LXDoubanUserUsers *model;
//cell高
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) CGRect imageVFrame;
@property (nonatomic, assign) CGRect nameLabelFrame;
@property (nonatomic, assign) CGRect descLabelFrame;

@end
