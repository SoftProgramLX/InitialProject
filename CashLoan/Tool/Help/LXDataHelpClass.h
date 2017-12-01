//
//  LXDataHelpClass.h
//  DNXB
//
//  Created by lixu on 2017/3/10.
//  Copyright © 2017年 dnxb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXDataHelpClass : NSObject

+ (LXDataHelpClass *)sharedLXDataHelpClass;

+ (AppDelegate *)appDelegate;

+ (CGFloat)calculateLabelHeighWithText:(NSString *)textStr withMaxSize:(CGSize)maxSize withFont:(CGFloat)font;

+ (NSString *)getCurrentTime;
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;

+ (NSString *)manageDeviceToken:(NSData *)deviceToken;

@end
