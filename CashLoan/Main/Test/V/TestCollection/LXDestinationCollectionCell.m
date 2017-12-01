//
//  LXDestinationCollectionCell.m
//  PrivateShare
//
//  Created by 李旭 on 16/9/19.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#import "LXDestinationCollectionCell.h"

@interface LXDestinationCollectionCell ()

@property (nonatomic, weak)   UIImageView *iconView;
@property (nonatomic, weak)   UILabel *nameLabel;
@property (nonatomic, weak)   UILabel *detailLabel;

@end

@implementation LXDestinationCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *headerImgView = [[UIImageView alloc] init];
        [self addSubview:headerImgView];
        self.iconView = headerImgView;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = [UIFont systemFontOfSize:16];
        nameLabel.textColor = kBlackFontColor;
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        UILabel *detailLabel = [[UILabel alloc] init];
        detailLabel.font = [UIFont systemFontOfSize:14];
        detailLabel.textColor = kGrayFontColor;
        detailLabel.textAlignment = NSTextAlignmentCenter;
        detailLabel.numberOfLines = 0;
        [self addSubview:detailLabel];
        self.detailLabel = detailLabel;
        
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(0, 0, 37, 0));
        }];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconView.mas_bottom).offset(5);
            make.left.and.right.equalTo(self);
            make.height.equalTo(@(self.nameLabel.font.pointSize));
        }];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(self.height-self.detailLabel.font.pointSize, 0, 0, 0));
        }];

    }
    return self;
}

- (void)configurationCell:(NSArray *)objectArr
{
    self.iconView.image = [UIImage imageNamed:objectArr[0]];
    self.nameLabel.text = objectArr[1];
    self.detailLabel.text = objectArr[2];

}

@end
