//
//  BigBugViewController.h
//  Photography Life
//
//  Created by qianfeng on 15/11/5.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLCustomSlideView.h"
@interface BigBugViewController : UIViewController<DLCustomSlideViewDelegate>

@property(strong,nonatomic)DLCustomSlideView * slideView;

@end
