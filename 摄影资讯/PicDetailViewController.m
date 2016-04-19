//
//  PicDetailViewController.m
//  Photography Life
//
//  Created by qianfeng on 15/11/6.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#import "PicDetailViewController.h"
#import "RequestModel.h"
#import "Header.h"
#import "UIImageView+AFNetworking.h"
#import "AppDelegate.h"
#import "UMSocial.h"

@interface PicDetailViewController ()<sendRequestInfo,UIScrollViewDelegate>
{
    NSInteger totalPage;
    NSMutableArray *_dataArr;
    NSMutableArray * imageArr;
    NSInteger index;
}
@end

@implementation PicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    totalPage = 0;
    index = 0;
    _dataArr = [[NSMutableArray alloc]init];
    imageArr = [[NSMutableArray alloc]init];
    self.view.backgroundColor = [UIColor colorWithRed:0.62f green:0.73f blue:0.79f alpha:1.00f];
    [self requestInfo];
    [self createUI];
}

-(void)createUI
{
    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    UIImageView * headerImageView = [[UIImageView alloc]initWithFrame:[delegate createFrameWithX:0 andY:0 andWidth:375 andHeight:60]];
    //给view开启用户交互
    headerImageView.userInteractionEnabled = YES;
    headerImageView.image = [UIImage imageNamed:@"app_end2"];
    [self.view addSubview:headerImageView];
    
    
    NSArray * hearderArr = @[@"app_fh",@"app_zj_fx_an"];
    for(int i = 0 ; i < hearderArr.count;i++)
    {
        UIButton * button = [[UIButton alloc]initWithFrame:[delegate createFrameWithX:15 + 300*i andY:10 andWidth:40 andHeight:40]];
        [button setBackgroundImage:[UIImage imageNamed:hearderArr[i]] forState:UIControlStateNormal];
        button.tag = i+1001 ;
        [button addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [headerImageView addSubview:button];
    }
}

-(void)pressBtn:(id)sender
{
    UIButton * button = (UIButton *)sender;
    if(button.tag == 1001)
    {
        [self dismissViewControllerAnimated:NO completion:nil];
    }
    if(button.tag == 1002)
    {
        [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeImage url:_web_url];
        [UMSocialSnsService presentSnsIconSheetView:self
                                             appKey:@"564001f5e0f55a9a63006cfc"
                                          shareText:@"我刚刚阅读APP摄影新资讯,分享给大家"
                                         shareImage:[UIImage imageNamed:@"icon"]
                                    shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,nil]
                                           delegate:self];
    }
    if(button.tag == 1003)
    {
        UIImageView * imageView = (UIImageView *)[self.view viewWithTag:index+1];
        UIImageWriteToSavedPhotosAlbum(imageView.image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
    }
}

-(void)requestInfo
{
    RequestModel * requestModel = [[RequestModel alloc]init];
    requestModel.path = _detail_url;
    requestModel.delegate = self;
    [requestModel startGetRequestInfo];
}

-(void)sendMessage:(id)message andPath:(NSString *)path
{
    NSMutableArray * titleArr = [[NSMutableArray alloc]init];
    NSMutableArray * dateArr = [[NSMutableArray alloc]init];
    NSString * pic_detaiStr = [[NSString alloc]init];
    for(NSDictionary * dic in message)
    {
        [imageArr addObject:dic[@"pic"][@"gq"]];
        [titleArr addObject:dic[@"doc_title"]];
        [dateArr addObject:dic[@"date"]];
        pic_detaiStr = message[0][@"pic"][@"pic_datil"];
    }
    totalPage = imageArr.count;

    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:[delegate createFrameWithX:0 andY:50 andWidth:375  andHeight:557]];
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.backgroundColor =[UIColor colorWithRed:0.62f green:0.73f blue:0.79f alpha:1.00f];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];

    scrollView.contentSize =[delegate createWidth:375*totalPage andHeight:507];
    [self.view addSubview:scrollView];
    
    //
    for(int i = 0 ; i < totalPage ; i++)
    {
        UIImageView * iconImageView = [[UIImageView alloc]initWithFrame:[delegate createFrameWithX:i*375 andY:20 andWidth:375 andHeight:507]];
        iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        [iconImageView setImageWithURL:[NSURL URLWithString:imageArr[i]]];
        iconImageView.tag = i+1;
        [scrollView addSubview:iconImageView];
        
        
        UILabel * label = [[UILabel alloc]initWithFrame:[delegate createFrameWithX:i*375 + 270 andY:517 andWidth:60 andHeight:50]];
        NSString * indexStr = [NSString stringWithFormat:@"%d/%ld",i+1,totalPage];
        label.text = indexStr;
        label.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label];
        
        UIButton * downLoadBtn = [[UIButton alloc]initWithFrame:[delegate createFrameWithX:i*375 + 315 andY:520 andWidth:60 andHeight:40]];
        [downLoadBtn setBackgroundImage:[UIImage imageNamed:@"btn_Save"] forState:UIControlStateNormal];
        [downLoadBtn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        downLoadBtn.tag = 1003;
        [scrollView addSubview:downLoadBtn];
    }
    
    UITextView * textView = [[UITextView alloc]initWithFrame:[delegate createFrameWithX:0 andY:603 andWidth:375 andHeight:64]];
    textView.text = pic_detaiStr;
    textView.font = [UIFont systemFontOfSize:14];
    textView.editable = NO;
    //给textView添加背景图片
    textView.layer.contents = (id)[UIImage imageNamed:@"bg_magazine"].CGImage;
    textView.layer.cornerRadius = 8;
    
    [self.view addSubview:textView];
}

-(void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
   
    if (!error)
    {
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"图片下载成功,请往相册中查看" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
        UIAlertView * alertView1 = [[UIAlertView alloc]initWithTitle:@"提示" message:@"图片下载失败" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alertView1 show];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    index = scrollView.contentOffset.x /375;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
