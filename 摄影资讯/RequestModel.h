//
//  RequestModel.h
//  Photography Life
//
//  Created by qianfeng on 15/11/3.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol sendRequestInfo<NSObject>

-(void)sendMessage:(id)message andPath:(NSString *)path;

@end

@interface RequestModel : NSObject

@property(nonatomic,copy)NSString * path ;
@property(nonatomic,assign)NSDictionary * dic;
@property(nonatomic,assign)id<sendRequestInfo>delegate;

-(void)startGetRequestInfo;
-(void)startPostRequestInfo;

@end
