//
//  RootMagazineViewController.h
//  摄影新资讯
//
//  Created by tang on 15/11/19.
//  Copyright © 2015年 ling. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RequestModel.h"
#import "Header.h"
#import "MJRefresh.h"
#import "AppDelegate.h"



@interface RootMagazineViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,sendRequestInfo>
{
    int currentPage;
    NSString * rootPath;
    
    UITableView * table;
    NSMutableArray * dataSource;
    
    //上拉加载
    BOOL isLoading;
    
    NSString * fid;
}

-(void)loadRequestInfo;

-(void)loadingAndRefreshing;
@end
