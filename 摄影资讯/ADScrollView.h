//
//  ADScrollView.h
//  UITableViewCell_Custom
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 陈凯文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADScrollView : UIView<UIScrollViewDelegate>

-(void)reloadDataWithArray:(NSArray *)array AndTitleArray:(NSArray *)titleArray;

@end
