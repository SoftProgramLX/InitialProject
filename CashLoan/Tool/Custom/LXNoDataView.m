//
//  LXNoDataView.m
//  CashLoan
//
//  Created by lixu on 2017/11/30.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import "LXNoDataView.h"

@implementation LXNoDataView

- (instancetype)initWithData:(NSArray *)showArr
{
    self = [super initWithFrame:CGRectMake(0, kScreenViewY, kScreenWidth, kScreenHeight-kScreenViewY)];
    if (self) {
        
        self.imgView.image = [UIImage imageNamed:showArr[0]];
        CGSize imgSize = self.imgView.image.size;
        CGRect frame = CGRectMake((self.width-imgSize.width)/2.0, 100, imgSize.width, imgSize.height);
        self.imgView.frame = frame;
        
        self.promptLabel.frame = CGRectMake(0, self.imgView.y + self.imgView.height + 60, kScreenWidth, 16);
        self.promptLabel.text = showArr[1];
        
        if (showArr.count > 2) {
            self.submitBtn.frame = CGRectMake((self.width-125)/2.0, self.promptLabel.y + self.promptLabel.height + 30, 125, 28);
            [self.submitBtn setTitle:showArr[2] forState:UIControlStateNormal];
        }
    }
    return self;
}

#pragma mark - Enent response

- (void)submitBtnClicked:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(noDataBtnClickedDelegate)]) {
        [self.delegate noDataBtnClickedDelegate];
    }
}

#pragma mark - Setter and getter

- (UIImageView *)imgView
{
    if (!_imgView) {
        UIImageView *imgView = [[UIImageView alloc] init];
        [self addSubview:imgView];
        _imgView = imgView;
    }
    return _imgView;
}

- (UILabel *)promptLabel
{
    if (!_promptLabel) {
        UILabel *promptLabel = [[UILabel alloc] init];
        promptLabel.textAlignment = NSTextAlignmentCenter;
        promptLabel.textColor = kColor(52, 52, 52);
        promptLabel.font = [UIFont boldSystemFontOfSize:14];
        [self addSubview:promptLabel];
        _promptLabel = promptLabel;
    }
    return _promptLabel;
}

- (UIButton *)submitBtn
{
    if (!_submitBtn) {
        UIButton *submitBtn = [[UIButton alloc] init];
        [submitBtn addTarget:self action:@selector(submitBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        submitBtn.backgroundColor = kColor(0, 168, 255);
        submitBtn.layer.cornerRadius = 4;
        submitBtn.layer.masksToBounds = YES;
        submitBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [submitBtn setTitleColor:kColor(255, 255, 255) forState:UIControlStateNormal];
        [self addSubview:submitBtn];
        _submitBtn = submitBtn;
    }
    return _submitBtn;
}

@end
