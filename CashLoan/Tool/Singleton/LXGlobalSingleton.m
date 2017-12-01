//
//  LXSingleton.m
//  DNXB
//
//  Created by lixu on 2017/3/10.
//  Copyright © 2017年 dnxb. All rights reserved.
//

#import "LXGlobalSingleton.h"


@implementation LXGlobalSingleton

kSingletonForClass(LXGlobalSingleton)

- (id)init
{
    self = [super init];
    if (self) {
        
        _sysVersion = [[UIDevice currentDevice] systemVersion];
        if ([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"]) {
            _isiPhone = YES;
        } else {
            _isiPhone = NO;
        };

    }
    return self;
}


@end
