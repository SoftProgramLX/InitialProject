//
//  LXDoubanUserResponse.m
//  CashLoan
//
//  Created by lixu on 2017/11/30.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import "LXDoubanUserResponse.h"

@implementation LXDoubanUserResponse

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"users":[LXDoubanUserUsers class]};
}

@end
