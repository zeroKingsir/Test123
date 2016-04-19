//
//  MGCustomCell.h
//  摄影新资讯
//
//  Created by tang on 15/11/19.
//  Copyright © 2015年 ling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MGCustomCell : UITableViewCell

@property(nonatomic,retain)UIImageView * iconImageView;
@property(nonatomic,retain)UILabel * titleLabel;
@property(nonatomic,retain)UILabel * excerptLabel;
@property(nonatomic,retain)UILabel * commentCountLabel;

@end
