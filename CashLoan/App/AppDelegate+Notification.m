//
//  AppDelegate+Notification.m
//  CashLoan
//
//  Created by lixu on 2017/11/30.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import "AppDelegate+Notification.h"
#import <CoreLocation/CoreLocation.h>

# warning 更换自己注册极光推送的真实的appKey
static NSString *appKey = @"93****************5e";
static NSString *channel = @"AppStore";

@interface AppDelegate ()

@end

@implementation AppDelegate (Notification)

- (void)registerNotification:(NSDictionary *)launchOptions
{
    [JPUSHService setLogOFF];
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        // 可以添加自定义categories
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    [JPUSHService setupWithOption:launchOptions appKey:appKey
                          channel:channel
                 apsForProduction:0];
    NSLog(@"lixulog:launchOptions:%@", launchOptions);
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

    [JPUSHService registerDeviceToken:deviceToken];
    
    NSString *deviceTokenStr = [LXDataHelpClass manageDeviceToken:deviceToken];
    [LXGlobalSingleton sharedLXGlobalSingleton].deviceToken = deviceTokenStr;
    [kUserDefaults setObject:deviceTokenStr forKey:kDeviceToken];
    [kUserDefaults synchronize];
    NSLog(@"deviceToken:%@", deviceToken);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

//iOS10 前台收到推送
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    NSLog(@"lixulog:%s", __func__);
    
    NSDictionary * userInfo = notification.request.content.userInfo;
    
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        NSLog(@"lixulog:iOS10 前台收到远程通知:%@", userInfo);
        
        //[self addNotificationCount];
        
    } else {
        // 判断为本地通知
        UNNotificationRequest *request = notification.request; // 收到推送的请求
        UNNotificationContent *content = request.content; // 收到推送的消息内容
        
        NSNumber *badge = content.badge;  // 推送消息的角标
        NSString *body = content.body;    // 推送消息体
        UNNotificationSound *sound = content.sound;  // 推送消息的声音
        NSString *subtitle = content.subtitle;  // 推送消息的副标题
        NSString *title = content.title;  // 推送消息的标题
        NSLog(@"lixulog:iOS10 前台收到本地通知:{\nbody:%@，\ntitle:%@,\nsubtitle:%@,\nbadge：%@，\nsound：%@，\nuserInfo：%@\n}",body,title,subtitle,badge,sound,userInfo);
    }
    
    completionHandler(UNNotificationPresentationOptionAlert);
    
    [self manageNewNotification:userInfo];
}

//iOS10 点击通知打开App
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    NSLog(@"lixulog:%s", __func__);

    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert);  // 系统要求执行这个方法
    
    [self manageNewNotification:userInfo];
}

//iOS7～9 前台收到推送与点击通知打开App
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    NSLog(@"lixulog:%s", __func__);
    
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
    
    [self manageNewNotification:userInfo];
}

- (void)manageNewNotification:(NSDictionary *)userInfo {
    NSLog(@"%ld", (long)self.application.applicationState);
    NSLog(@"lixulog::%@", userInfo);
    //在前台
    if (self.application.applicationState == UIApplicationStateActive) {
        //弹框提示
    } else {
        //push到指定控制器
    }
}

@end


/*
userInfo：
{
    "_j_business" = 1;
    "_j_msgid" = 2271629377;
    "_j_uid" = 6223053802;
    aps =     {
        alert = 消息内容;
        badge = 1;
        sound = default;
    };
}
*/

/*
//添加本地通知
- (void)testAddNotification {
    JPushNotificationContent *content = [[JPushNotificationContent alloc] init];
    content.title = @"Test Notifications";
    content.subtitle = @"2017";
    content.body = @"This is a test code";
    content.badge = @1;
    content.categoryIdentifier = @"Custom Category Name";
    
    // 5s后提醒 iOS 10 以上支持
    JPushNotificationTrigger *trigger1 = [[JPushNotificationTrigger alloc] init];
    trigger1.timeInterval = 5;
    //每小时重复 1 次 iOS 10 以上支持
    JPushNotificationTrigger *trigger2 = [[JPushNotificationTrigger alloc] init];
    trigger2.timeInterval = 3600;
    trigger2.repeat = YES;
    
    //每周一早上8：00提醒，iOS10以上支持
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.weekday = 2;
    components.hour = 8;
    JPushNotificationTrigger *trigger3 = [[JPushNotificationTrigger alloc] init];
    trigger3.dateComponents = components;
    trigger3.repeat = YES;
    
    //一到某地点提醒，iOS8以上支持
    CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:CLLocationCoordinate2DMake(0, 0) radius:0 identifier:@"test"];
    JPushNotificationTrigger *trigger4 = [[JPushNotificationTrigger alloc] init];
    trigger4.region = region;
    
    //5s后提醒，iOS10以下支持
    JPushNotificationTrigger *trigger5 = [[JPushNotificationTrigger alloc] init];
    trigger5.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    
    JPushNotificationRequest *request = [[JPushNotificationRequest alloc] init];
    request.requestIdentifier = @"sampleRequest";
    request.content = content;
    request.trigger = trigger5;//trigger2;//trigger3;//trigger4;//trigger5;
    request.completionHandler = ^(id result) {
        NSLog(@"结果返回：%@", result);
    };
    [JPUSHService addNotification:request];
}
*/

