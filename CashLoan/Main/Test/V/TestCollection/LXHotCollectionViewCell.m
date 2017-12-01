//
//  LXHotCollectionViewCell.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXHotCollectionViewCell.h"

@interface LXHotCollectionViewCell ()

@property (nonatomic, weak)   UILabel *nameLabel;
@property (nonatomic, weak)   UILabel *detailLabel;

@end

@implementation LXHotCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *headerImgView = [[UIImageView alloc] init];
        [self addSubview:headerImgView];
        self.backgroundView = headerImgView;
        
        UIView *maskView = [[UIView alloc] init];
        maskView.backgroundColor = kColora(255, 255, 255, 0.7);
        [self addSubview:maskView];
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = [UIFont systemFontOfSize:16];
        nameLabel.textColor = kBlackFontColor;
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        UILabel *detailLabel = [[UILabel alloc] init];
        detailLabel.text = @"NewZealan";
        detailLabel.font = [UIFont systemFontOfSize:12];
        detailLabel.textColor = kBlackFontColor;
        detailLabel.textAlignment = NSTextAlignmentCenter;
        detailLabel.numberOfLines = 0;
        [self addSubview:detailLabel];
        self.detailLabel = detailLabel;
        
        [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(141-50, 0, 0, 0));
        }];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(maskView.mas_top).offset(10);
            make.left.equalTo(maskView.mas_left).offset(5);
            make.height.equalTo(@(self.nameLabel.font.pointSize));
        }];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(maskView.mas_bottom).offset(-10);
            make.left.equalTo(self.nameLabel.mas_left);
            make.height.equalTo(@(self.detailLabel.font.pointSize));
        }];
    }
    return self;
}

- (void)configurationCell:(NSArray *)objectArr
{
    UIImageView *headerImgView = (UIImageView *)self.backgroundView;
    headerImgView.image = [UIImage imageNamed:objectArr[0]];
    
    self.nameLabel.text = objectArr[1];
    self.detailLabel.text = objectArr[2];
}

@end
