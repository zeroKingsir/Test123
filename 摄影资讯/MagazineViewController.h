//
//  MagazineViewController.h
//  Photography Life
//
//  Created by qianfeng on 15/11/3.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#import "ViewController.h"
#import "DLSlideView.h"
#import "DLCustomSlideView.h"
//#import "DLSlideView/DLCustomSlideView.h"
@interface MagazineViewController : ViewController<DLCustomSlideViewDelegate>

@property(nonatomic,retain)DLCustomSlideView *whSlideView;

@end
