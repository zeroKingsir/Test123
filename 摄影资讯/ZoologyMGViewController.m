//
//  ZoologyMGViewController.m
//  摄影新资讯
//
//  Created by tang on 15/11/19.
//  Copyright © 2015年 ling. All rights reserved.
//

#import "ZoologyMGViewController.h"

@interface ZoologyMGViewController ()

@end

@implementation ZoologyMGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    rootPath = NATURE_URL;
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
