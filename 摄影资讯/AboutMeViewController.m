//
//  AboutMeViewController.m
//  Photography Life
//
//  Created by ling on 15/11/15.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#import "AboutMeViewController.h"
#import "AppDelegate.h"
@interface AboutMeViewController ()

@end

@implementation AboutMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self createUI];
    self.title = @"关于我们";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"首页背景底"]]];
}

-(void)createUI
{
    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    
    UIImageView * icomImageView = [[UIImageView alloc]initWithFrame:[delegate createFrameWithX:150 andY:60 andWidth:75 andHeight:75]];
    icomImageView.image = [UIImage imageNamed:@"icon@2x"];
    [self.view addSubview:icomImageView];
    
    UILabel * label = [[UILabel alloc]initWithFrame:[delegate createFrameWithX:100 andY:130 andWidth:180 andHeight:75]];
    label.text = @"摄影爱好者的资讯平台";
    label.alpha = 0.6;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label];
    
    UILabel * label1 = [[UILabel alloc]initWithFrame:[delegate createFrameWithX:20 andY:220 andWidth:350 andHeight:30]];
    label1.text = @"传递最新摄影资讯,享受快乐摄影生活";
    label1.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:label1];
    
    
    UITextView * textView = [[UITextView alloc]initWithFrame:[delegate createFrameWithX:20 andY:250 andWidth:340 andHeight:110]];
    textView.text = @"摄影新资讯是个人开发的一款APP,这里融汇了最实用的摄影技巧,最具个性的摄影摄影作品;涉及人物,风光,生活,建筑等摄影技巧和佳作;及时更新摄影资讯,为广大摄影爱好者提供免费的交流和学习平台;希望摄影新资讯,能够带给大家带来快乐和收获,感谢大家对摄影新资讯的支持.";
    textView.editable = NO;
    textView.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:textView];
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
