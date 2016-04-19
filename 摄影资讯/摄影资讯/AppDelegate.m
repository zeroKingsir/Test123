//
//  AppDelegate.m
//  摄影资讯
//
//  Created by MS on 16-1-18.
//  Copyright (c) 2016年 王双月. All rights reserved.
//

#import "AppDelegate.h"
#import "UMSocial.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UMSocialData setAppKey:@"564001f5e0f55a9a63006cfc"];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    NSMutableArray * subViewCtr = [[NSMutableArray alloc]init];
    NSArray * ClassArr = @[@"Top",@"BigBug",@"Magazine",@"Other"];
    NSArray * array = @[@"首页",@"每日一图",@"杂志",@"更多"];
    NSArray * imageArr = @[@"tabbaritem_home_normal",@"tabbaritem_dailyPic_normal",@"tabbaritem_magazine_normal",@"tabbaritem_more_normal"];
    NSArray * selectImageArr = @[@"tabbaritem_home_selected",@"tabbaritem_dailyPic_selected",@"tabbaritem_magazine_selected",@"tabbaritem_more_selected"];
    
    for(int i = 0 ; i <ClassArr.count ; i ++)
    {
        NSString * classStr = [NSString stringWithFormat:@"%@ViewController",ClassArr[i]];
        Class viewController = NSClassFromString(classStr);
        UIViewController * vCtr = [[viewController alloc]init];
        
        UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vCtr];
        vCtr.navigationItem.title = array[i];
        [vCtr.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar_Bg_1"] forBarMetrics:UIBarMetricsDefault];
        
        
        nav.tabBarItem.image = [[UIImage imageNamed:imageArr[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageArr[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        
        [subViewCtr addObject:nav];
    }
    
    UITabBarController * tabBar = [[UITabBarController alloc]init];
    //    tabBar.tabBar.translucent = NO;
    tabBar.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
    //        tabBar.tabBar.backgroundColor = [UIColor blackColor];
    tabBar.tabBar.frame = CGRectMake(0, HEIGHT-49, WIDTH, 49);
    tabBar.viewControllers = subViewCtr;
    self.window.rootViewController = tabBar;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    

    // Override point for customization after application launch.
    return YES;
}


//适配方法
-(CGRect)createFrameWithX:(CGFloat)x andY:(CGFloat)y andWidth:(CGFloat)width andHeight:(CGFloat)height
{
    return CGRectMake(x * ( WIDTH/375.0), y * (HEIGHT/667.0), width * (WIDTH/375.0), height * (HEIGHT/667.0));
}

-(CGFloat)createHeight:(CGFloat)height
{
    return height * (HEIGHT/667);
}

-(CGSize)createWidth:(CGFloat)width andHeight:(CGFloat)height
{
    return CGSizeMake(width *(WIDTH/375 ), height*(HEIGHT/667));
}

-(UIEdgeInsets)createTop:(CGFloat)top andLeft:(CGFloat)left andBottom:(CGFloat)bottom andRight:(CGFloat)right
{
    return UIEdgeInsetsMake(top*(HEIGHT/667), left*(WIDTH/375), bottom*(HEIGHT/667), right*(WIDTH/375));
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.QF.____" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"____" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"____.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
