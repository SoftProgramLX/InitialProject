//
//  LXGuideScrollView.m
//  CashLoan
//
//  Created by lixu on 2017/11/28.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import "LXGuideScrollView.h"

#define numberOfNewFeaturePic 4

@interface LXGuideScrollView () <UIScrollViewDelegate>
@property(nonatomic,weak) UIPageControl *pageControl;

@end

@implementation LXGuideScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentSize = CGSizeMake(numberOfNewFeaturePic * self.width, 0);
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.delegate = self;
        self.bounces= YES;
        [self createImageView];
        [self createPageControl];
    }
    return self;
}

- (void)createImageView
{
    for (int i = 0; i<numberOfNewFeaturePic; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        NSString *str = [NSString stringWithFormat:@"%d",1];
        imageView.image = [UIImage imageNamed:str];
        imageView.x = i * self.width;
        
        if (i == numberOfNewFeaturePic-1) {
            UIButton *gotoHomeBtn = [[UIButton alloc] initWithFrame:CGRectMake(90, kScreenHeight - 168, kScreenWidth - 180, 44)];
            [gotoHomeBtn setTitle:@"立即进入" forState:UIControlStateNormal];
            [gotoHomeBtn setTitleColor:kRedFontColor forState:UIControlStateNormal];
            [gotoHomeBtn setBackgroundColor:[UIColor whiteColor]];
            [gotoHomeBtn addTarget:self action:@selector(goToHome) forControlEvents:UIControlEventTouchUpInside];
            gotoHomeBtn.layer.cornerRadius = 20;
            gotoHomeBtn.layer.masksToBounds = YES;
            imageView.userInteractionEnabled = YES;
            [imageView addSubview:gotoHomeBtn];
        }
        [self addSubview:imageView];
    }
}

- (void)createPageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = numberOfNewFeaturePic;
    pageControl.centerX = self.width * 0.5;
    pageControl.centerY = self.height - 100;
    pageControl.currentPageIndicatorTintColor = kColor(251, 239, 197);
    pageControl.pageIndicatorTintColor = kColor(255,157,133);
    self.pageControl = pageControl;
    [[LXDataHelpClass appDelegate].window addSubview:pageControl];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat doublePage = scrollView.contentOffset.x / scrollView.width;
    int intPage = (int)(doublePage + 0.5);
    self.pageControl.currentPage = intPage;
    if (doublePage > (numberOfNewFeaturePic - 0.7)) {
        [self goToHome];
    }
}

- (void)goToHome
{
    [self.pageControl removeFromSuperview];
    self.pageControl = nil;
    [self removeFromSuperview];
}

@end
