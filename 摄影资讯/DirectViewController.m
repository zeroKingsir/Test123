//
//  DirectViewController.m
//  Photography Life
//
//  Created by ling on 15/11/15.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#import "DirectViewController.h"
#import "AppDelegate.h"
@interface DirectViewController ()<UIScrollViewDelegate>
{
    UIPageControl * pageCtr;
}
@end

@implementation DirectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新手使用指引";
    [self createUI];
}

-(void)createUI
{
    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    NSArray * imageArr = @[@"guide1",@"guide2",@"guide3",@"guide5.jpg"];
    
    UIScrollView * scroll = [[UIScrollView alloc]initWithFrame:[delegate createFrameWithX:0 andY:0 andWidth:375 andHeight:604]];
    scroll.contentSize = [delegate createWidth:375 * imageArr.count andHeight:604];
    scroll.pagingEnabled = YES;
    scroll.contentOffset = CGPointMake(0, 0);
    scroll.delegate = self;
    scroll.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scroll];
    
    
    for(int i = 0 ; i < imageArr.count ; i++)
    {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:[delegate createFrameWithX:375*i andY:0 andWidth:375 andHeight:650]];
        imageView.image = [UIImage imageNamed:imageArr[i]];
        [scroll addSubview:imageView];
    }
    pageCtr = [[UIPageControl alloc]initWithFrame:[delegate createFrameWithX:50 andY:560 andWidth:275 andHeight:30]];
    pageCtr.currentPage = 0;
    pageCtr.numberOfPages = imageArr.count;
    pageCtr.pageIndicatorTintColor = [UIColor redColor];
    [self.view addSubview:pageCtr];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageCtr.currentPage = scrollView.contentOffset.x / self.view.frame.size.width;
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
