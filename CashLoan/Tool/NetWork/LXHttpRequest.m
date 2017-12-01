//
//  LXHttpRequest.m
//  DNXB
//
//  Created by lixu on 2017/3/15.
//  Copyright © 2017年 dnxb. All rights reserved.
//

#import "LXHttpRequest.h"

static AFHTTPSessionManager *httpManager;

@implementation LXHttpRequest

kSingletonForClass(LXHttpRequest)

- (id)init
{
    self = [super init];
    if (self) {
        self.wifiStatus = AFNetworkReachabilityStatusReachableViaWiFi;
        httpManager = [LXHttpRequest createManager];
    }
    return self;
}

+ (void)post:(NSString *)url param:(id)param success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    if ([self brokenNetProcessing]) if (failure) failure(nil);
    
    [httpManager POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObj) {
        if ([[responseObj class] isSubclassOfClass:[NSDictionary class]]) {
            if (success) success(responseObj);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) failure(error);
    }];
}

+ (void)get:(NSString *)url param:(id)param success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure
{
    if ([self brokenNetProcessing]) if (failure) failure(nil);
    
    [httpManager GET:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObj) {
        if ([[responseObj class] isSubclassOfClass:[NSDictionary class]]) {
            if (success) success(responseObj);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@", error);
        if (failure) failure(error);
    }];
}

- (void)listenerCurrentNetStauts
{
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        [LXHttpRequest sharedLXHttpRequest].wifiStatus = status;
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:            //未知网络
                break;
            case AFNetworkReachabilityStatusNotReachable:       //没有网络(断网)
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:   //手机自带网络
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:   //WIFI
                break;
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:kNetworkReachabilityStatus object:[NSString stringWithFormat:@"%d", (int)status]];
    }];
    [mgr startMonitoring];
}

+ (AFHTTPSessionManager*)createManager
{
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html",@"application/json",@"text/json",nil];
    //[manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];

    return manager;
}

+ (BOOL)brokenNetProcessing
{
    if ([self sharedLXHttpRequest].wifiStatus < 1) {
        [LXUIHelpClass toastWithBrokenNet];
        return YES;
    }
    
    return NO;
}


/*
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    //对应域名的校验我认为应该在url中去逻辑判断。--》冯龙腾写
    //通过对url字符串的切割对子域名进行逻辑验证处理。
    
    // 1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    // 2.申明返回的结果是text/html类型
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",nil];
    // 3.设置超时时间为10s
    mgr.requestSerializer.timeoutInterval = 10;
    
    // 加上这行代码，https ssl 验证。
    if(openHttpsSSL)
    {
        [mgr setSecurityPolicy:[self customSecurityPolicy]];
    }
    
    // 4.发送POST请求
    [mgr POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)get:(NSString *)url param:(NSString *)param success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure
{
    // 1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    // 2.申明返回的结果是text/html类型
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",nil];
    // 3.设置超时时间为10s
    mgr.requestSerializer.timeoutInterval = 10;
    
    // 加上这行代码，https ssl 验证。
    if(openHttpsSSL)
    {
        [mgr setSecurityPolicy:[self customSecurityPolicy]];
    }
    
    // 4.发送GET请求
    [mgr GET:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (AFSecurityPolicy*)customSecurityPolicy
{
    // /先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:certificate ofType:@"cer"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    // AFSSLPinningModeCertificate 使用证书验证模式
    //AFSSLPinningModeNone: 代表客户端无条件地信任服务器端返回的证书。
    //AFSSLPinningModePublicKey: 代表客户端会将服务器端返回的证书与本地保存的证书中，PublicKey的部分进行校验；如果正确，才继续进行。
    //AFSSLPinningModeCertificate: 代表客户端会将服务器端返回的证书和本地保存的证书中的所有内容，包括PublicKey和证书部分，全部进行校验；如果正确，才继续进行。
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    //对应域名的校验我认为应该在url中去逻辑判断。--》冯龙腾写
    securityPolicy.validatesDomainName = NO;
    if (certData) {
        securityPolicy.pinnedCertificates = @[certData];
    }
 
    return securityPolicy;
}
*/

@end



