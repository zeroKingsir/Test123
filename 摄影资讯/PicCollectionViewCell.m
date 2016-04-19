//
//  PicCollectionViewCell.m
//  Photography Life
//
//  Created by qianfeng on 15/11/5.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#import "PicCollectionViewCell.h"
#import "AppDelegate.h"
@implementation PicCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIApplication * application=[UIApplication sharedApplication];
        AppDelegate * delegate=application.delegate;
        
        self.iconImageView = [[UIImageView alloc]initWithFrame:[delegate createFrameWithX:4 andY:4 andWidth:167 andHeight:133]];
        [self.contentView addSubview:self.iconImageView];
        
        
        self.titleLabel = [[UILabel alloc]initWithFrame:[delegate createFrameWithX:6 andY:135 andWidth:165 andHeight:40]];
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.alpha = 0.7;
        self.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:self.titleLabel];
        
    }
    return self;
}
@end
