//
//  LXNoDataView.h
//  CashLoan
//
//  Created by lixu on 2017/11/30.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LXNoDataViewDelegate <NSObject>

@optional
- (void)noDataBtnClickedDelegate;

@end

@interface LXNoDataView : UIView

@property (nonatomic, weak) UIImageView *imgView;
@property (nonatomic, weak) UILabel *promptLabel;
@property (nonatomic, weak) UIButton *submitBtn;

@property (nonatomic, weak) id<LXNoDataViewDelegate> delegate;

- (instancetype)initWithData:(NSArray *)showArr;


@end
