//
//  LXNavBarController.h
//  LXCustomUI
//
//  Created by 李旭 on 16/9/12.
//  Copyright © 2016年 LX. All rights reserved.
//


@interface LXNavBarController : LXBaseController

@property (nonatomic, weak)   UIView *navBar;
@property (nonatomic, weak)   UILabel *titleLabel;
@property (nonatomic, weak)   UIButton *leftBtn;
@property (nonatomic, weak)   UIButton *rightBtn;

@property (nonatomic, copy)   NSString *titleStr;

- (void)leftImageNormalStr:(NSString *)normalStr withAction:(SEL)sel;
- (void)leftImageNormalStr:(NSString *)normalStr withHlightedStr:(NSString *)hlightedStr withAction:(SEL)sel;

- (void)leftTextNormalStr:(NSString *)normalStr withAction:(SEL)sel;
- (void)leftTextNormalStr:(NSString *)normalStr withHlightedStr:(NSString *)hlightedStr withAction:(SEL)sel;

- (void)rightImageNormalStr:(NSString *)normalStr withAction:(SEL)sel;
- (void)rightImageNormalStr:(NSString *)normalStr withHlightedStr:(NSString *)hlightedStr withAction:(SEL)sel;

- (void)rightTextNormalStr:(NSString *)normalStr withAction:(SEL)sel;
- (void)rightTextNormalStr:(NSString *)normalStr withHlightedStr:(NSString *)hlightedStr withAction:(SEL)sel;

- (void)back;
- (void)back:(UIButton *)sender;

@end


