//
//  MagazineViewController.m
//  Photography Life
//
//  Created by qianfeng on 15/11/3.
//  Copyright (c) 2015年 凌小惯. All rights reserved.
//

#import "MagazineViewController.h"
#import "TopDetailViewController.h"
#import "DLLRUCache.h"
#import "DLScrollTabbarView.h"


#import "NewViewController.h"
#import "SkillViewController.h"
#import "CompositionViewController.h"
#import "EquipmentViewController.h"
#import "TreatmentViewController.h"
#import "FigureViewController.h"
#import "ReportViewController.h"
#import "SceneMGViewController.h"
#import "ZoologyMGViewController.h"
#import "BusinessViewController.h"



@interface MagazineViewController ()
{
   
    NSMutableArray *nameArray;
    
}

@end

@implementation MagazineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}
-(void)createUI{
    
    _whSlideView=[[DLCustomSlideView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    DLLRUCache *cache=[[DLLRUCache alloc] initWithCount:10];
    DLScrollTabbarView *tabbar=[[DLScrollTabbarView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 34)];
    tabbar.tabItemNormalColor=[UIColor lightGrayColor];
    tabbar.tabItemSelectedColor=[UIColor redColor];
    tabbar.tabItemNormalFontSize=15.0f;
    tabbar.trackColor=[UIColor redColor];
    [self.view addSubview:tabbar];
    
    nameArray=[[NSMutableArray alloc] init];
    NSArray *arr=@[@"新手入门",@"摄影技巧",@"构图美学",@"器材装备",@"后期处理",@"人像摄影",@"纪实摄影",@"风光摄影",@"生态摄影",@"商业摄影"];
    
    for (int i=0; i<10; i++) {
        DLScrollTabbarItem *item=[DLScrollTabbarItem itemWithTitle:arr[i] width:80*(self.view.frame.size.width/375)];
        [nameArray addObject:item];
    }
    
    
    //设置协议
    _whSlideView.delegate=self;
    tabbar.tabbarItems=nameArray;
    
    UIImageView * imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    imageView.image=[UIImage imageNamed:@"首页背景底"];
    imageView.backgroundColor = [UIColor whiteColor];
    tabbar.backgroundView=imageView;
    
    _whSlideView.tabbar=tabbar;
    _whSlideView.cache=cache;
    _whSlideView.tabbarBottomSpacing=0;
    _whSlideView.baseViewController=self;
    [_whSlideView setup];
    _whSlideView.selectedIndex=0;
    [self.view addSubview:_whSlideView];
    
    
    
      
    
}
-(NSInteger)numberOfTabsInDLCustomSlideView:(DLCustomSlideView *)sender{
    return nameArray.count;
}

-(UIViewController *)DLCustomSlideView:(DLCustomSlideView *)sender controllerAt:(NSInteger)index{


    switch (index) {

        case 0:{
            NewViewController * new = [[NewViewController alloc]init];
            
            return new;
        }
            break;
        case 1:{
            
            SkillViewController * skill = [[SkillViewController alloc]init];
            
            return skill;

        }
            break;
            
        case 2:{
            CompositionViewController * com = [[CompositionViewController alloc]init];
            return com;
        }
            break;
            
        case 3:{
            EquipmentViewController * equip = [[EquipmentViewController alloc]init];
            return equip;
        }
            break;
            
        case 4:{
            TreatmentViewController * treatment = [[TreatmentViewController alloc]init];
            return treatment;
        }
            break;
        case 5:{
            FigureViewController * figure = [[FigureViewController alloc]init];
            return figure;
        }
            break;
        case 6:{
            ReportViewController * report = [[ReportViewController alloc]init];
            return report;
        }
            break;
        case 7:{
            SceneMGViewController * scene = [[SceneMGViewController alloc]init];
            return scene;
        }
            break;
        case 8:{
            ZoologyMGViewController * zoology = [[ZoologyMGViewController alloc]init];
            return zoology;
        }
            break;
        case 9:{
            BusinessViewController * business = [[BusinessViewController alloc]init];
            return business;
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
