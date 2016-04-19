//
//  VersionViewController.m
//  Photography Life
//
//  Created by ling on 15/11/14.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#import "VersionViewController.h"
#import "AppDelegate.h"
@interface VersionViewController ()

@end

@implementation VersionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    self.title = @"版本信息";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"首页背景底"]]];
    
}

-(void)createUI
{
    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    
    UIImageView * icomImageView = [[UIImageView alloc]initWithFrame:[delegate createFrameWithX:150 andY:120 andWidth:75 andHeight:75]];
    icomImageView.image = [UIImage imageNamed:@"icon@2x"];
    [self.view addSubview:icomImageView];
    
    
    UILabel * label = [[UILabel alloc]initWithFrame:[delegate createFrameWithX:120 andY:190 andWidth:130 andHeight:75]];
    label.text = @"摄影新资讯1.0.1";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
