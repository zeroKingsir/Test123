//
//  RootViewController.h
//  Photography Life
//
//  Created by qianfeng on 15/11/5.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RequestModel.h"
#import "Header.h"
#import "MJRefresh.h"
#import "AppDelegate.h"
@interface RootViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,sendRequestInfo,UICollectionViewDelegateFlowLayout>
{
    int currentPage;
    NSString * rootPath;
    
    UICollectionView * _collectionView;
    NSMutableArray * dataSource;
    
    //上拉加载
    BOOL isLoading;
    
    NSString * fid;
}
//创建请求对象进行数据请求
//由于不同的接口对应不同的请求对象 所以使用该方法创建三个不同的对象
-(void)loadRequestInfo;

//加载刷新
-(void)loadingAndRefreshing;



@end
