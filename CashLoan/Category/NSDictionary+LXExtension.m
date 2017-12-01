//
//  NSDictionary+LXExtension.m
//  CashLoan
//
//  Created by lixu on 2017/12/1.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import "NSDictionary+LXExtension.h"

@implementation NSDictionary (LXExtension)

- (NSMutableString*)switchToString
{
    NSError *parseError = nil;
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSMutableString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
