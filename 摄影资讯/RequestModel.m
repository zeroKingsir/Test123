//
//  RequestModel.m
//  Photography Life
//
//  Created by qianfeng on 15/11/3.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#import "RequestModel.h"
#import "AFHTTPRequestOperationManager.h"
@implementation RequestModel

-(void)startGetRequestInfo
{
    AFHTTPRequestOperationManager * manager = [[AFHTTPRequestOperationManager alloc]init];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"multipart/form-data",@"application/x-www-form-urlencoded", nil];
    [manager GET:self.path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         if([self.delegate respondsToSelector:@selector(sendMessage:andPath:)])
         {
             [_delegate sendMessage:responseObject andPath:_path];
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
     }];
}

-(void)startPostRequestInfo
{
    
    //<1>
    AFHTTPRequestOperationManager * manager = [[AFHTTPRequestOperationManager alloc]init];
    
    //<2>
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"multipart/form-data",@"application/x-www-form-urlencoded", nil];
    
    [manager POST:self.path parameters:self.dic success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         if([self.delegate respondsToSelector:@selector(sendMessage:andPath:)])
         {
             [_delegate sendMessage:responseObject andPath:_path];
         }
         NSLog(@"数据请求成功");
      
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
         NSLog(@"%@",error.description);
     }];

}



@end
