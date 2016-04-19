//
//  AppDelegate.h
//  摄影资讯
//
//  Created by MS on 16-1-18.
//  Copyright (c) 2016年 王双月. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#define WIDTH (float)(self.window.frame.size.width)
#define HEIGHT (float)(self.window.frame.size.height)
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


-(CGRect)createFrameWithX:(CGFloat)x andY:(CGFloat)y andWidth:(CGFloat)width andHeight:(CGFloat)height;
-(CGFloat)createHeight:(CGFloat)height;
-(CGSize)createWidth:(CGFloat)width andHeight:(CGFloat)height;
-(UIEdgeInsets)createTop:(CGFloat)top andLeft:(CGFloat)left andBottom:(CGFloat)bottom andRight:(CGFloat)right;

@end

