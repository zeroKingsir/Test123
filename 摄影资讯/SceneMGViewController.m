//
//  SceneMGViewController.m
//  摄影新资讯
//
//  Created by tang on 15/11/19.
//  Copyright © 2015年 ling. All rights reserved.
//

#import "SceneMGViewController.h"

@interface SceneMGViewController ()

@end

@implementation SceneMGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    rootPath = LANDSCAPE_URL;
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
