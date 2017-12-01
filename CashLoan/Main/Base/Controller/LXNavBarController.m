//
//  LXNavBarController.m
//  LXCustomUI
//
//  Created by 李旭 on 16/9/12.
//  Copyright © 2016年 LX. All rights reserved.
//

#import "LXNavBarController.h"

#define kScreenBtnGap 12
#define kBtnWidth 44
#define kBtnHlightedColor [UIColor colorWithRed:1.000 green:0.749 blue:0.061 alpha:1.000]
#define kBtnNormalColor [UIColor whiteColor]

@implementation LXNavBarController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kBackGroundColor;
}

#pragma mark - Interface

-(void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    self.titleLabel.text = titleStr;
}

- (void)leftImageNormalStr:(NSString *)normalStr withAction:(SEL)sel
{
    [self.leftBtn setImage:[UIImage imageNamed:normalStr] forState:UIControlStateNormal];
    [self.leftBtn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
}

- (void)leftImageNormalStr:(NSString *)normalStr withHlightedStr:(NSString *)hlightedStr withAction:(SEL)sel
{
    [self leftImageNormalStr:normalStr withAction:sel];
    
    [self.leftBtn setImage:[UIImage imageNamed:hlightedStr] forState:UIControlStateHighlighted];
}

- (void)leftTextNormalStr:(NSString *)normalStr withAction:(SEL)sel
{
    [self.leftBtn setTitle:normalStr forState:UIControlStateNormal];
    [self.leftBtn setTitleColor:kBtnNormalColor forState:UIControlStateNormal];
    [self.leftBtn setTitleColor:kBtnHlightedColor forState:UIControlStateHighlighted];
    [self.leftBtn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    
    [self.leftBtn sizeToFit];
    self.leftBtn.y += (kBtnWidth - self.leftBtn.height)/2.0;
}

- (void)leftTextNormalStr:(NSString *)normalStr withHlightedStr:(NSString *)hlightedStr withAction:(SEL)sel
{
    [self leftTextNormalStr:normalStr withAction:sel];
    
    [self.leftBtn setTitle:hlightedStr forState:UIControlStateHighlighted];
}

- (void)rightImageNormalStr:(NSString *)normalStr withAction:(SEL)sel
{
    [self.rightBtn setImage:[UIImage imageNamed:normalStr] forState:UIControlStateNormal];
    [self.rightBtn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
}

- (void)rightImageNormalStr:(NSString *)normalStr withHlightedStr:(NSString *)hlightedStr withAction:(SEL)sel
{
    [self rightImageNormalStr:normalStr withAction:sel];
    
    [self.rightBtn setImage:[UIImage imageNamed:hlightedStr] forState:UIControlStateHighlighted];
}

- (void)rightTextNormalStr:(NSString *)normalStr withAction:(SEL)sel
{
    [self.rightBtn setTitle:normalStr forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:kBtnNormalColor forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:kBtnHlightedColor forState:UIControlStateHighlighted];
    [self.rightBtn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    
    [self.rightBtn sizeToFit];
    self.rightBtn.x -= self.rightBtn.width - kBtnWidth;
    self.rightBtn.y += (kBtnWidth - self.rightBtn.height)/2.0;
}

- (void)rightTextNormalStr:(NSString *)normalStr withHlightedStr:(NSString *)hlightedStr withAction:(SEL)sel
{
    [self rightTextNormalStr:normalStr withAction:sel];
    
    [self.rightBtn setTitle:hlightedStr forState:UIControlStateHighlighted];
}

#pragma mark - Enent response

- (void)back
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)back:(UIButton *)sender
{
    [self back];
}

#pragma mark - Setter and getter

-(UIView *)navBar
{
    if (_navBar == nil) {
        UIView *navBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
        navBar.backgroundColor = [UIColor colorWithRed:0.153 green:0.402 blue:0.191 alpha:1.000];
        [self.view addSubview:navBar];
        _navBar = navBar;
    }
    
    return _navBar;
}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 20, kScreenWidth - 100, 44)];
        label.font = [UIFont systemFontOfSize:19];
        label.textColor = [UIColor whiteColor];
        label.numberOfLines = 0;
        label.textAlignment = NSTextAlignmentCenter;
        [self.navBar addSubview:label];
        _titleLabel = label;
    }
    
    return _titleLabel;
}

-(UIButton *)leftBtn
{
    if (_leftBtn == nil) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenBtnGap, 20 + (44 - kBtnWidth)/2.0, kBtnWidth, kBtnWidth)];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        btn.backgroundColor = [UIColor colorWithRed:0.120 green:0.110 blue:0.319 alpha:1.000];
        [self.navBar addSubview:btn];
        _leftBtn = btn;
    }
    
    return _leftBtn;
}

-(UIButton *)rightBtn
{
    if (_rightBtn == nil) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - kScreenBtnGap - kBtnWidth, 20 + (44 - kBtnWidth)/2.0, kBtnWidth, kBtnWidth)];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
//        btn.backgroundColor = [UIColor colorWithRed:0.120 green:0.110 blue:0.319 alpha:1.000];
        [self.navBar addSubview:btn];
        _rightBtn = btn;
    }
    [_rightBtn sizeToFit];
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    return _rightBtn;
}

@end
