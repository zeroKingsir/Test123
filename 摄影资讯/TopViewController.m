//
//  TopViewController.m
//  Photography Life
//
//  Created by qianfeng on 15/11/3.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#import "TopViewController.h"
#import "RequestModel.h"
#import "Header.h"
#import "CustomCell.h"
#import "UIImageView+AFNetworking.h"
#import "MJRefresh.h"
#import "AppDelegate.h"
#import "TopDetailViewController.h"
#import "ADScrollView.h"

#define HEIGHT (float)(self.view.frame.size.height)
@interface TopViewController ()<UITableViewDataSource,UITableViewDelegate,sendRequestInfo>
{
    NSMutableArray * dataSource;
    UITableView * table;
    int currentPage ;
    //上拉加
    BOOL isLoading;

}
@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataSource = [[NSMutableArray alloc]init];
    
    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    table = [[UITableView alloc]initWithFrame:[delegate createFrameWithX:0 andY:0 andWidth:375 andHeight:667] style:UITableViewStylePlain];
    currentPage = 1 ;
    
    table.delegate = self;
    table.dataSource = self;
    
    [self.view addSubview:table];
    [self requestInfo];
    [self loadingAndRefreshing];
}
-(void)requestInfo
{
    RequestModel * request = [[RequestModel alloc]init];
    request.delegate = self;
    request.path = [NSString stringWithFormat:Top_URL,currentPage];
    [request startGetRequestInfo];
    
    RequestModel * ImageRequest = [[RequestModel alloc]init];
    ImageRequest.delegate = self;
    ImageRequest.path = Start_URL;
    [ImageRequest startGetRequestInfo];
    
}
-(void)sendMessage:(id)message andPath:(NSString *)path
{
    if([path isEqualToString:Start_URL])
    {
        
        NSMutableArray * imageArr = [[NSMutableArray alloc]init];
        for(NSDictionary * dic in message)
        {
            [imageArr addObject:dic[@"pic_src"]];
        }
        
        NSMutableArray *titleArray=[[NSMutableArray alloc] init];
        for (NSDictionary *dic in message) {
            [titleArray addObject:dic[@"title"]];
        }
        
        UIApplication * application=[UIApplication sharedApplication];
        AppDelegate * delegate=application.delegate;
        ADScrollView * scroll = [[ADScrollView alloc]initWithFrame:[delegate createFrameWithX:0 andY:0 andWidth:375 andHeight:200]];
        [scroll reloadDataWithArray:imageArr AndTitleArray:titleArray];
        table.tableHeaderView = scroll;
        
    }
    else
    {
        [dataSource addObjectsFromArray:message[@"list"]];
        [table reloadData];
        
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * string = @"cell";
    CustomCell * cell = [tableView dequeueReusableCellWithIdentifier:string];
    if(cell == nil)
    {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    cell.titleLabel.text = dataSource[indexPath.row][@"title"];
    [cell.iconImageView setImageWithURL:[NSURL URLWithString:dataSource[indexPath.row][@"pic_url"]]];
    //给cell添加背景图片
    UIImageView * imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    imageView.image=[UIImage imageNamed:@"首页背景底"];
    cell.backgroundView = imageView;
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    return [delegate createHeight:90];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopDetailViewController * detailCtr = [[TopDetailViewController alloc]init];
    detailCtr.ID = dataSource[indexPath.row][@"doc_id"];
    detailCtr.web_url = dataSource[indexPath.row][@"web_url"];
    [self.navigationController pushViewController:detailCtr animated:NO];
}
-(void)loadingAndRefreshing
{
    [table addFooterWithCallback:^{
        if (isLoading)
        {
            return;
        }
        isLoading=YES;
        currentPage++;
        
        [self requestInfo];
        
        isLoading=NO;
        [table footerEndRefreshing];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
