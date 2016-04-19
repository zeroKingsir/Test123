//
//  BigBugViewController.m
//  Photography Life
//
//  Created by qianfeng on 15/11/5.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#import "BigBugViewController.h"
#import "DLLRUCache.h"
#import "DLScrollTabbarView.h"
#import "AppDelegate.h"

#import "PortraitViewController.h"
#import "SceneViewController.h"
#import "EcologyViewController.h"
#import "DigitalViewController.h"
#import "NewLearnerViewController.h"
#import "PatViewController.h"
#import "LifeViewController.h"
#import "ConstructViewController.h"


@interface BigBugViewController ()
{
    NSMutableArray * nameArray ;
}
@end

@implementation BigBugViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    
}

-(void)createUI
{
    self.navigationController.navigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIApplication * application=[UIApplication sharedApplication];
    AppDelegate * delegate=application.delegate;
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:[delegate createFrameWithX:0 andY:20 andWidth:375 andHeight:50]];
    imageView.image = [UIImage imageNamed:@"btn_location_switch_bg"];
    [self.view addSubview:imageView];
    
    _slideView = [[DLCustomSlideView alloc]initWithFrame:[delegate createFrameWithX:5 andY:37 andWidth:375 andHeight:617]];
    [self.view addSubview:_slideView];
    
    DLLRUCache *cache = [[DLLRUCache alloc]initWithCount:8];
    DLScrollTabbarView *tabBar = [[DLScrollTabbarView alloc]initWithFrame:[delegate createFrameWithX:0 andY:10 andWidth:375 andHeight:34]];
    tabBar.tabItemNormalColor = [UIColor blackColor];
    tabBar.tabItemSelectedColor = [UIColor redColor];
    tabBar.tabItemNormalFontSize = 16.0f;
    tabBar.trackColor = [UIColor redColor];
    [imageView addSubview:tabBar];
    
    nameArray = [[NSMutableArray alloc]init];
    
    NSArray *array = @[@"人像",@"风光",@"生态",@"数码",@"新手",@"宠物",@"生活",@"建筑"];
    for (int i = 0; i < 8 ; i ++)
    {
        DLScrollTabbarItem *item = [DLScrollTabbarItem itemWithTitle:array[i] width:60];
        [nameArray addObject:item];
    }
    
    //设置协议
    _slideView.delegate = self;
    tabBar.tabbarItems = nameArray;
    _slideView.tabbar = tabBar;
    _slideView.cache = cache;
    _slideView.tabbarBottomSpacing = 5;
    _slideView.baseViewController = self;
    ;//self;
    [_slideView setup];
    _slideView.selectedIndex = 0;
    
    
}
-(NSInteger)numberOfTabsInDLCustomSlideView:(DLCustomSlideView *)sender
{
    return [nameArray count];
}

-(UIViewController *)DLCustomSlideView:(DLCustomSlideView *)sender controllerAt:(NSInteger)index
{
    switch (index) {
        case 0:
        {
            PortraitViewController * portrait = [[PortraitViewController alloc]init];
            return portrait;
        }
            break;
        case 1:
        {
            SceneViewController * scene = [[SceneViewController alloc]init];
            return scene;
        }
            break;
        case 2:
        {
            EcologyViewController * ecology = [[EcologyViewController alloc]init];
            return ecology;
        }
            break;
        case 3:
        {
            DigitalViewController * digital = [[DigitalViewController alloc]init];
            return digital;
        }
            break;
        case 4:
        {
            NewLearnerViewController * newLearner = [[NewLearnerViewController alloc]init];
            return newLearner;
        }
            break;
        case 5:
        {
            PatViewController * pat = [[PatViewController alloc]init];
            return pat;
        }
            break;
        case 6:
        {
            LifeViewController * life = [[LifeViewController alloc]init];
            return life;
        }
            break;
        case 7:
        {
            ConstructViewController * construct = [[ConstructViewController alloc]init];
            return construct;
        }
            break;
            
        default:
            return nil;
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
