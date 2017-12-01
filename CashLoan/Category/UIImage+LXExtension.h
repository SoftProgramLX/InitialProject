//
//  UIImage+Extension.h
//  LXBaseConfigProject
//
//  Created by lx on 16/1/11.
//  Copyright © 2016年 lx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LXExtension)

//将图片中心扩大
+ (UIImage *)resizedImage:(NSString *)name;
//设置圆形头像
- (UIImage *)cutIntoACircleImage;

@end
