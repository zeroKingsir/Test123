//
//  CustomCell.m
//  Photography Life
//
//  Created by qianfeng on 15/11/4.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#import "CustomCell.h"
#import "AppDelegate.h"
@implementation CustomCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        UIApplication * application=[UIApplication sharedApplication];
        AppDelegate * delegate=application.delegate;
        
        self.iconImageView=[[UIImageView alloc]initWithFrame:[delegate createFrameWithX:250 andY:10 andWidth:110 andHeight:70]];
        [self.contentView addSubview:self.iconImageView];
        
        self.titleLabel=[[UILabel alloc]initWithFrame:[delegate createFrameWithX:20 andY:10 andWidth:220 andHeight:70]];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:self.titleLabel];

    }
    return self;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
