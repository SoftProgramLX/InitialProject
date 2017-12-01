//
//  ConstOfStatus.h
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#ifndef ConstOfStatus_h
#define ConstOfStatus_h

// 屏幕宽与高
#define kScreenWidth  ([UIScreen mainScreen].applicationFrame.size.width)
#define kScreenHeight (([UIScreen mainScreen].applicationFrame.size.height)+20)

#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type)  __strong typeof(type) type = weak##type;

#define kScreenGapMin 12
#define kScreenGapNormal 18
#define kScreenViewY 64

#endif /* ConstOfStatus_h */
