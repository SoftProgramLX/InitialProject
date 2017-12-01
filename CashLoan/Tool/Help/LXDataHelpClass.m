//
//  LXDataHelpClass.m
//  DNXB
//
//  Created by lixu on 2017/3/10.
//  Copyright © 2017年 dnxb. All rights reserved.
//

#import "LXDataHelpClass.h"

@implementation LXDataHelpClass

kSingletonForClass(LXDataHelpClass)

+ (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

+ (CGFloat)calculateLabelHeighWithText:(NSString *)textStr withMaxSize:(CGSize)maxSize withFont:(CGFloat)font
{
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:font], NSFontAttributeName, nil];
    CGSize actualSize = [textStr boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:tdic context:nil].size;
    return actualSize.height;
}

+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (NSString *)getCurrentTime
{
    // 当前时间
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[date timeIntervalSince1970]*1000; // *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", a]; //转为字符型
    return timeString;
}

+ (NSString *)manageDeviceToken:(NSData *)deviceToken
{
    NSMutableString *deviceTokenStr = [NSMutableString stringWithFormat:@"%@", deviceToken];
    [deviceTokenStr setString:[deviceTokenStr substringWithRange:NSMakeRange(1, deviceTokenStr.length-2)]];
    [deviceTokenStr setString:[deviceTokenStr stringByReplacingOccurrencesOfString:@" " withString:@""]];
    return deviceTokenStr;
}

@end
