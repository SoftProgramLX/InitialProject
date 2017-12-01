//
//  LXHelpClass.h
//  DNXB
//
//  Created by lixu on 2017/3/10.
//  Copyright © 2017年 dnxb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface LXUIHelpClass : NSObject

+ (LXUIHelpClass *)sharedLXUIHelpClass;

//将view转为image
+ (UIImage *)getImageFromView:(UIView *)view;

+ (void)toastWithBrokenNet;
+ (void)toast:(NSString *)text;

@end
