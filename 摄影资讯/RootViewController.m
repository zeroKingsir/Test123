//
//  RootViewController.m
//  Photography Life
//
//  Created by qianfeng on 15/11/5.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#import "RootViewController.h"
#import "PicCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "PicDetailViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataSource = [[NSMutableArray alloc]init];
    [self createUI];
    currentPage = 1 ;
    fid = @"0";
  

}
-(void)createUI
{
    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing  = 5;
    layout.minimumInteritemSpacing = 5;
 

   
    _collectionView  = [[UICollectionView alloc]initWithFrame:[delegate createFrameWithX:-5 andY:-5 andWidth:375 andHeight:617] collectionViewLayout:layout];
    
    _collectionView.dataSource = self ;
    _collectionView.delegate = self ;
    [self.view addSubview:_collectionView];

    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 70, 375, 597)];
    imageView.image = [UIImage imageNamed:@"bg_magazine"];
    _collectionView.backgroundView = imageView;
    
    [_collectionView registerClass:[PicCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

-(void)loadRequestInfo
{
    RequestModel * requestModel = [[RequestModel alloc]init];
    NSString * Path = [NSString stringWithFormat:rootPath,fid,currentPage];
    requestModel.delegate = self;
    requestModel.path = Path;
    [requestModel startGetRequestInfo];
}

-(void)sendMessage:(id)message andPath:(NSString *)path
{
    [dataSource addObjectsFromArray:message[@"list"]];
    [_collectionView reloadData];
}

#pragma mark -  UICollectionView 相关的方法
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return dataSource.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * string = @"cell";
    PicCollectionViewCell * cell = [_collectionView dequeueReusableCellWithReuseIdentifier:string forIndexPath:indexPath];
    
    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:[delegate createFrameWithX:0 andY:0 andWidth:177 andHeight:175]];
    
    imageView.image = [UIImage imageNamed:@"bg_new_magazine_shadow"];
    cell.backgroundView = imageView;
    cell.titleLabel.text = dataSource[indexPath.row][@"title"];
    [cell.iconImageView setImageWithURL:[NSURL URLWithString:dataSource[indexPath.row][@"pic_url"]]];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    return [delegate createWidth:175 andHeight:175];
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    return [delegate createTop:7.5 andLeft:7.5 andBottom:0 andRight:7.5];

    
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    return [delegate createHeight:10];

}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    
    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    return [delegate createHeight:5];

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PicDetailViewController * picDetail = [[PicDetailViewController alloc]init];
    picDetail.detail_url = dataSource[indexPath.row][@"detail_url"];
    picDetail.web_url = dataSource[indexPath.row][@"web_url"];

    
    [self presentViewController:picDetail animated:NO completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)loadingAndRefreshing
{
    [_collectionView addFooterWithCallback:^{
        if (isLoading)
        {
            return;
        }
        isLoading=YES;
        currentPage++;
        
        [self loadRequestInfo];
        
        isLoading=NO;
        [_collectionView footerEndRefreshing];
    }];
}

@end























































