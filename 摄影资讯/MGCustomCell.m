//
//  MGCustomCell.m
//  摄影新资讯
//
//  Created by tang on 15/11/19.
//  Copyright © 2015年 ling. All rights reserved.
//

#import "MGCustomCell.h"
#import "AppDelegate.h"

@implementation MGCustomCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        UIApplication * application=[UIApplication sharedApplication];
        AppDelegate * delegate=application.delegate;
        
        self.iconImageView=[[UIImageView alloc]initWithFrame:[delegate createFrameWithX:10 andY:10 andWidth:130 andHeight:120]];
        [self.contentView addSubview:self.iconImageView];
        
        self.titleLabel=[[UILabel alloc]initWithFrame:[delegate createFrameWithX:150 andY:15 andWidth:220 andHeight:20]];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.numberOfLines = 0;
        [self.contentView addSubview:self.titleLabel];
        
        
        self.excerptLabel = [[UILabel alloc]initWithFrame:[delegate createFrameWithX:150 andY:30 andWidth:220 andHeight:100]];
        self.excerptLabel.numberOfLines=0;
        self.excerptLabel.font=[UIFont systemFontOfSize:12];
        self.excerptLabel.alpha = 0.7;
        [self.contentView addSubview:self.excerptLabel];
        
        
        self.commentCountLabel = [[UILabel alloc]initWithFrame:[delegate createFrameWithX:320 andY:120 andWidth:42 andHeight:15]];
        self.commentCountLabel.font=[UIFont systemFontOfSize:10];
        self.commentCountLabel.alpha = 0.7;
        [self.contentView addSubview:self.commentCountLabel];
        
    }
    return self;
}



- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
