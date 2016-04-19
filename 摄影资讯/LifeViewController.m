//
//  LifeViewController.m
//  Photography Life
//
//  Created by qianfeng on 15/11/5.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#import "LifeViewController.h"

@interface LifeViewController ()

@end

@implementation LifeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    rootPath = Life_URL;
    fid = @"115";
    [self loadRequestInfo];
    [self loadingAndRefreshing];
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
