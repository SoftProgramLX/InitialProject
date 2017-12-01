//
//  LXHelpClass.m
//  DNXB
//
//  Created by lixu on 2017/3/10.
//  Copyright © 2017年 dnxb. All rights reserved.
//

#import "LXUIHelpClass.h"

@implementation LXUIHelpClass

kSingletonForClass(LXUIHelpClass)

+ (UIImage *)getImageFromView:(UIView *)view
{
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (void)toastWithBrokenNet
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[LXDataHelpClass appDelegate].window animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = @"网络连接错误";
    [hud.button setTitle:@"刷新一下" forState:UIControlStateNormal];
    [hud.button addTarget:self action:@selector(hudBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [hud hideAnimated:YES afterDelay:3];
}

+ (void)hudBtnClicked
{
    
}

+ (void)toast:(NSString *)text
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[LXDataHelpClass appDelegate].window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:1];
    //根据需求更改不限于下面的属性值，也可自定义弹框。
    hud.label.font = [UIFont systemFontOfSize:16];
    hud.contentColor = [UIColor colorWithRed:0.f green:0.6f blue:0.7f alpha:1.f];
    hud.offset = CGPointMake(0.f, 200.f);
    hud.margin = 10;
}

@end
