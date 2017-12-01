//
//  LXExpertCollectionCell.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXExpertCollectionCell.h"

@interface LXExpertCollectionCell ()

@property (nonatomic, weak)   UIImageView *headerImgView;
@property (nonatomic, weak)   UILabel *nameLabel;
@property (nonatomic, weak)   UILabel *detailLabel;

@end

@implementation LXExpertCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *vline = [[UIView alloc] init];
        vline.backgroundColor = kLineColor;
        [self addSubview:vline];
        
        UIView *hline = [[UIView alloc] init];
        hline.backgroundColor = kLineColor;
        [self addSubview:hline];
        
        UIImageView *headerImgView = [[UIImageView alloc] init];
        [self addSubview:headerImgView];
        self.headerImgView = headerImgView;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = [UIFont systemFontOfSize:16];
        nameLabel.textColor = kBlackFontColor;
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        UILabel *detailLabel = [[UILabel alloc] init];
        detailLabel.font = [UIFont systemFontOfSize:12];
        detailLabel.textColor = kGrayFontColor;
        detailLabel.textAlignment = NSTextAlignmentCenter;
        detailLabel.numberOfLines = 0;
        [self addSubview:detailLabel];
        self.detailLabel = detailLabel;
        
        [vline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.equalTo(self);
            make.left.equalTo(self.mas_right);
            make.width.equalTo(@(0.5));
        }];
        [hline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(self);
            make.top.equalTo(self.mas_bottom);
            make.height.equalTo(@(0.5));
        }];
        
        [self.headerImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(10);
            make.centerX.equalTo(self.mas_centerX);
            make.width.and.height.equalTo(@(50));
        }];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headerImgView.mas_bottom).offset(5);
            make.width.equalTo(self.mas_width);
            make.height.equalTo(@(self.nameLabel.font.pointSize));
        }];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLabel.mas_bottom);
            make.left.equalTo(self).offset(kScreenGapMin);
            make.right.equalTo(self).offset(-kScreenGapMin);
            make.bottom.equalTo(self.mas_bottom).offset(-5);
        }];
        
    }
    return self;
}

- (void)configurationCell:(NSArray *)objectArr
{
    self.headerImgView.image = [[UIImage imageNamed:objectArr[0]] cutIntoACircleImage];
    self.nameLabel.text = objectArr[1];
    self.detailLabel.text = objectArr[2];
}

@end



