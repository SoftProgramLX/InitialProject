//
//  LXSingleton.h
//  DNXB
//
//  Created by lixu on 2017/3/10.
//  Copyright © 2017年 dnxb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXGlobalSingleton : NSObject

@property (nonatomic, assign) BOOL isiPhone;
@property (nonatomic, copy) NSString *sysVersion;
@property (nonatomic, copy) NSString *deviceToken;
@property (nonatomic, copy) NSString *currentVersion;

+ (LXGlobalSingleton *)sharedLXGlobalSingleton;

@end
