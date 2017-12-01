//
//  LXTestTableViewCell.m
//  CashLoan
//
//  Created by lixu on 2017/11/29.
//  Copyright © 2017年 lixu. All rights reserved.
//

#import "LXTestTableViewCell.h"
#import "LXTestTabletFrames.h"

@interface LXTestTableViewCell ()

@property (nonatomic, weak) UIImageView *imageV;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *descLabel;

@end

@implementation LXTestTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImageView *imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:imageV];
        self.imageV = imageV;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        UILabel *descLabel = [[UILabel alloc] init];
        descLabel.font = [UIFont systemFontOfSize:14];
        descLabel.numberOfLines = 0;
        descLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:descLabel];
        self.descLabel = descLabel;
    }
    return self;
}

- (void)configurationCell:(LXTestTabletFrames *)frame
{
    self.imageV.frame = frame.imageVFrame;
    self.nameLabel.frame = frame.nameLabelFrame;
    self.descLabel.frame = frame.descLabelFrame;
    
    LXDoubanUserUsers *model = frame.model;
    self.nameLabel.text = model.name;
    self.descLabel.text = model.desc;
    
    self.imageV.image = nil;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.avatar] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.imageV.image = [image cutIntoACircleImage];
    }];
}

@end


