//
//  LXDoubanBookResult.m
//  CashLoan
//
//  Created by lixu on 2017/11/29.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import "LXDoubanBookResponse.h"

@implementation LXDoubanBookResponse

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"tags":[LXDoubanBookTags class]};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}

@end
