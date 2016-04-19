//
//  OtherViewController.m
//  Photography Life
//
//  Created by ling on 15/11/14.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#import "OtherViewController.h"
#import "VersionViewController.h"
#import "DirectViewController.h"
#import "AboutMeViewController.h"
#import "AppDelegate.h"
#import "UIImageView+AFNetworking.h"
@interface OtherViewController ()<UIScrollViewDelegate>

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTap];

}

-(void)addTap
{
    _versionImageView.userInteractionEnabled = YES;
    _directImageView.userInteractionEnabled = YES;
    _aboutMeImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressTap1:)];
    [_versionImageView addGestureRecognizer:tap1];
    
    
    UITapGestureRecognizer * tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressTap3:)];
    [_directImageView addGestureRecognizer:tap3];
    
    UITapGestureRecognizer * tap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressTap4:)];
    [_aboutMeImageView addGestureRecognizer:tap4];

}

-(void)pressTap1:(UITapGestureRecognizer *)tap
{

    VersionViewController * version = [[VersionViewController alloc]init];
    [self.navigationController pushViewController:version animated:YES];
    
}
-(void)pressTap3:(UITapGestureRecognizer *)tap
{
    DirectViewController * direct = [[DirectViewController alloc]init];
    [self.navigationController pushViewController:direct animated:YES];
}

-(void)pressTap4:(UITapGestureRecognizer *)tap
{
    AboutMeViewController * aboutMe = [[AboutMeViewController alloc]init];
    [self.navigationController pushViewController:aboutMe animated:YES];
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
