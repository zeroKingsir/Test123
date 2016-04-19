//
//  MGDetailViewController.m
//  摄影新资讯
//
//  Created by tang on 15/11/20.
//  Copyright © 2015年 ling. All rights reserved.
//

#import "MGDetailViewController.h"
#import "AppDelegate.h"
#import "RequestModel.h"
#import "Header.h"
#import "UIImageView+AFNetworking.h"
@interface MGDetailViewController ()<UIWebViewDelegate,sendRequestInfo>
{
    UIWebView * webView;
    UIView * bgView;
    UIImageView * imgView;
}
@end

@implementation MGDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleName;
    [self createUI];
    [self loadRequestInfo];
   
}

-(void)createUI
{
    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    webView = [[UIWebView alloc]initWithFrame:[delegate createFrameWithX:0 andY:0 andWidth:375 andHeight:607]];
    webView.delegate = self;
    webView.scalesPageToFit = YES;
    [self.view addSubview:webView];
    
}

-(void)loadRequestInfo
{
    RequestModel * request = [[RequestModel alloc]init];
    request.delegate = self;
    request.path = self.detailPath;
    [request startGetRequestInfo];
}

-(void)sendMessage:(id)message andPath:(NSString *)path
{
    NSDictionary *dic=[[NSDictionary alloc] init];
    dic=message[@"post"];
    
    [webView loadHTMLString:[NSString stringWithFormat:@"<p>%@</p>", dic[@"content"]] baseURL:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden=NO;
}
-(void)webViewDidFinishLoad:(UIWebView *)awebView
{
    //调整字号
    NSString *str = @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '200%'";
    
    [webView stringByEvaluatingJavaScriptFromString:str];
    
    static  NSString * const jsGetImages =@"function getImages(){\
    var objs = document.getElementsByTagName(\"img\");\
    for(var i=0;i<objs.length;i++){\
    objs[i].onclick=function(){\
    document.location=\"myweb:imageClick:\"+this.src;\
    };\
    };\
    return objs.length;\
    };";
    [webView stringByEvaluatingJavaScriptFromString:jsGetImages];
    NSString *resurlt = [webView stringByEvaluatingJavaScriptFromString:@"getImages()"];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *requestString = [[request URL] absoluteString];

    if ([requestString hasPrefix:@"myweb:imageClick:"]) {
        NSString *imageUrl = [requestString substringFromIndex:@"myweb:imageClick:".length];
        if (bgView) {
            bgView.hidden = NO;
            imgView.frame = CGRectMake(0, 0,350, 295);
            [imgView setImageWithURL:[NSURL URLWithString:imageUrl]];
        }
        else
            [self showBigImage:imageUrl];
        
        return NO;
    }
    return YES;
}

#pragma mark 显示大图片
-(void)showBigImage:(NSString *)imageUrl{
    
    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    
    //创建灰色透明背景，使其背后内容不可操作
    bgView = [[UIView alloc] initWithFrame:[delegate createFrameWithX:0 andY:0 andWidth:375 andHeight:667]];
    [bgView setBackgroundColor:[UIColor colorWithRed:0.3
                                               green:0.3
                                                blue:0.3
                                               alpha:0.7]];
    [self.view addSubview:bgView];
    
    
    //创建边框视图
    UIView *borderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 355, 300)];
    //将图层的边框设置为圆脚
    borderView.layer.cornerRadius = 8;
    borderView.layer.masksToBounds = YES;
    //给图层添加一个有色边框
    borderView.layer.borderWidth = 8;
    borderView.layer.borderColor = [[UIColor colorWithRed:0.9
                                                    green:0.9
                                                     blue:0.9
                                                    alpha:0.7] CGColor];
    [borderView setCenter:bgView.center];
    [bgView addSubview:borderView];
    
    //创建关闭按钮
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setImage:[UIImage imageNamed:@"close_btn@2x"] forState:UIControlStateNormal];
    closeBtn.backgroundColor = [UIColor redColor];
    [closeBtn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    closeBtn.tag = 101;
    [closeBtn setFrame:CGRectMake(borderView.frame.origin.x+borderView.frame.size.width-20, borderView.frame.origin.y-6, 26, 27)];
    [bgView addSubview:closeBtn];
    
    //创建显示图像视图
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, CGRectGetWidth(borderView.frame)-20, CGRectGetHeight(borderView.frame)-20)];
    imgView.userInteractionEnabled = YES;
    imgView.tag = 10;
    [imgView setImageWithURL:[NSURL URLWithString:imageUrl]];
    [borderView addSubview:imgView];
    
    UIButton * button = [[UIButton alloc]initWithFrame:[delegate createFrameWithX:265 andY:225 andWidth:40 andHeight:30]];
    [button setBackgroundImage:[UIImage imageNamed:@"btn_Save"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 100;
    [imgView addSubview:button];
    
    
    //添加捏合手势
    [imgView addGestureRecognizer:[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinch:)]];
    
}


- (void) handlePinch:(UIPinchGestureRecognizer*) recognizer
{
    //缩放:设置缩放比例
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}

-(void)pressBtn:(id)sender
{
    UIImageView * imageView = (UIImageView *)[self.view viewWithTag:10];
    UIButton * button = (id)sender;
    if(button.tag == 100)
    {
        UIImageWriteToSavedPhotosAlbum(imageView.image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
    }
    if(button.tag == 101)
    {
        //关闭手势
        bgView.hidden = YES;
    }
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
