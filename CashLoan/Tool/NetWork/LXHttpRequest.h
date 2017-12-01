//
//  LXHttpRequest.h
//  DNXB
//
//  Created by lixu on 2017/3/15.
//  Copyright © 2017年 dnxb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXHttpRequest : NSObject

@property (nonatomic, assign) AFNetworkReachabilityStatus wifiStatus;

+ (LXHttpRequest *)sharedLXHttpRequest;

/**
 *  发送一个POST请求
 *
 *  @param url     请求路径
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)post:(NSString *)url param:(id)param success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

+ (void)get:(NSString *)url param:(id)param success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;
- (void)listenerCurrentNetStauts;

@end
