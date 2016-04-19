//
//  RootMagazineViewController.m
//  摄影新资讯
//
//  Created by tang on 15/11/19.
//  Copyright © 2015年 ling. All rights reserved.
//

#import "RootMagazineViewController.h"
#import "UIImageView+AFNetworking.h"
#import "MGCustomCell.h"
#import "MGDetailViewController.h"
@interface RootMagazineViewController ()

@end

@implementation RootMagazineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataSource = [[NSMutableArray alloc]init];
    currentPage = 1 ;
    [self createUI];
   
}

-(void)createUI
{
    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    
    table = [[UITableView alloc]initWithFrame:[delegate createFrameWithX:0 andY:0 andWidth:375 andHeight:667] style:UITableViewStylePlain];

    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
}

-(void)loadRequestInfo
{
    RequestModel * request = [[RequestModel alloc]init];
    request.delegate = self;
    request.path = [NSString stringWithFormat:rootPath,currentPage];
    [request startGetRequestInfo];
}

-(void)sendMessage:(id)message andPath:(NSString *)path
{
    [dataSource addObjectsFromArray:message[@"posts"]];
    [table reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataSource.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * string = @"cell";
    MGCustomCell * cell = [tableView dequeueReusableCellWithIdentifier:string];
    if(cell == nil)
    {
        cell = [[MGCustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    cell.titleLabel.text = dataSource[indexPath.row][@"title"];
    cell.excerptLabel.text = dataSource[indexPath.row][@"excerpt"];
    cell.commentCountLabel.text = [NSString stringWithFormat:@"评论  %@",dataSource[indexPath.row][@"comment_count"]];
    [cell.iconImageView setImageWithURL:[NSURL URLWithString:dataSource[indexPath.row][@"thumbnail"]]];
    UIImageView * imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    imageView.image=[UIImage imageNamed:@"首页背景底"];
    cell.backgroundView = imageView;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    return [delegate createHeight:140];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MGDetailViewController * detail = [[MGDetailViewController alloc]init];
    detail.detailPath = [NSString stringWithFormat:MGDetail_URL,dataSource[indexPath.row][@"id"]];
    detail.ID = dataSource[indexPath.row][@"id"];
    detail.titleName = dataSource[indexPath.row][@"title"];
    [self.navigationController pushViewController:detail animated:YES];
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
        
        [self loadRequestInfo];
        
        isLoading=NO;
        [table footerEndRefreshing];
    }];
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
