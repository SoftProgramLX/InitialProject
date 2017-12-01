//
//  AppDelegate+Notification.h
//  CashLoan
//
//  Created by lixu on 2017/11/30.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import "AppDelegate.h"
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

@interface AppDelegate (Notification) <JPUSHRegisterDelegate>

- (void)registerNotification:(NSDictionary *)launchOptions;

@end
