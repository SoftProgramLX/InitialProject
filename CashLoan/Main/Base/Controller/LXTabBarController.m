//
//  LXTabBarController.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXTabBarController.h"
#import "LXNavigationController.h"
#import "LXGuideScrollView.h"
#import "LXHomeController.h"
#import "LXProfileController.h"
#import "LXStoreController.h"

@interface LXTabBarController ()

@end

@implementation LXTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    LXHomeController *homeVC = [[LXHomeController alloc] init];
    [self addOneChlildVc:homeVC title:@"首页" navigationTitle:@"首页" imageName:nil selectedImageName:nil];
    
    LXStoreController *storeVC = [[LXStoreController alloc] init];
    [self addOneChlildVc:storeVC title:@"商店" navigationTitle:@"商店" imageName:nil selectedImageName:nil];
    
    LXProfileController *profileVC = [[LXProfileController alloc] init];
    [self addOneChlildVc:profileVC title:@"我的" navigationTitle:@"我的" imageName:nil selectedImageName:nil];
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"bg_tab"];
    self.tabBar.translucent = NO;
}

- (void)addOneChlildVc:(LXNavBarController *)childVc title:(NSString *)title navigationTitle:(NSString *)navTitle imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childVc.title = title;
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor blueColor];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    childVc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    
    LXNavigationController *nav = [[LXNavigationController alloc] initWithRootViewController:childVc];
    nav.navigationBarHidden = YES;
    childVc.titleStr = navTitle;
    [self addChildViewController:nav];
}

#pragma mark - 版本设置
- (void)judgeCurrentVersion
{
    //比较上次的使用情况
    NSString *versionKey = (__bridge NSString *)kCFBundleVersionKey;
    NSString *lastVersion = [kUserDefaults objectForKey:versionKey];
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
    [LXGlobalSingleton sharedLXGlobalSingleton].currentVersion = currentVersion;
    
    if (![currentVersion isEqualToString:lastVersion]) {
        //显示引导页，不需要显示时将_displayGuide设置为NO;
        BOOL displayGuide = NO;
        //新用户lastVersion == nil
        if(lastVersion == nil || displayGuide) {
            [self.view addSubview:[[LXGuideScrollView alloc] initWithFrame:self.view.bounds]];
        }
        
        //存储这次使用的版本
        [kUserDefaults setObject:currentVersion forKey:versionKey];
        [kUserDefaults synchronize];
    }
}

@end
