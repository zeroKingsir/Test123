//
//  ADScrollView.m
//  UITableViewCell_Custom
//
//  Created by qianfeng on 15/9/26.
//  Copyright (c) 2015年 陈凯文00. All rights reserved.
//

#import "ADScrollView.h"
#import "UIImageView+AFNetworking.h"

@implementation ADScrollView
{
    UIScrollView *_srollView;
    UIPageControl *_page;
    UILabel *_label;
    NSMutableArray *_dataArr;
    NSTimer *_timer;
    NSInteger _index;
    NSInteger _oldIndex;
    BOOL _isRunning;
}
-(void)dealloc{
    if (_timer !=nil) {
        [_timer invalidate];
    }
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createSubView];
        _dataArr = [[NSMutableArray alloc]init];
        _index = 0;
        _isRunning = YES;
        _timer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(scrollViewDidEndDecelerating:) userInfo:nil repeats:YES];
    }
    return self;
}
-(void)createSubView{
    _srollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    _srollView.delegate = self;
    _srollView.pagingEnabled = YES;
    //_srollView.contentSize = CGSizeMake(self.frame.size.width * 5, 0);
    _srollView.showsHorizontalScrollIndicator = NO;
    _srollView.showsVerticalScrollIndicator = NO;
    [self addSubview:_srollView];
    _page = [[UIPageControl alloc]initWithFrame:CGRectMake(_srollView.frame.size.width - 100, self.frame.size.height - 40, 100, 40)];
    _page.backgroundColor = [UIColor blackColor];
    _page.alpha = 0.5;
    _page.currentPage = 0;
    [self addSubview:_page];
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height-40, 100, 40)];
    _label.textColor = [UIColor whiteColor];
    _label.backgroundColor = [UIColor clearColor];
    _label.font = [UIFont boldSystemFontOfSize:15];
    //[self addSubview:_label];
}
-(void)reloadDataWithArray:(NSArray *)array AndTitleArray:(NSArray *)titleArray{
    //根据数据多少，设置显示尺寸的大小
    _srollView.contentSize = CGSizeMake(_srollView.frame.size.width *array.count, _srollView.frame.size.height);
    //刷新显示图片
    for (UIView *subView in _srollView.subviews) {
        [subView removeFromSuperview];
    }
    //添加新的显示图片
    for (int i = 0; i < array.count ; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * _srollView.frame.size.width, 0, _srollView.frame.size.width, _srollView.frame.size.height)];
        //[imageView setImageWithURL:[NSURL URLWithString:array[i]]];
        //[_srollView addSubview:imageView];
        
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, imageView.frame.size.height-40,10, 40)];
        view.backgroundColor=[UIColor blackColor];
        view.alpha=1;
        [imageView addSubview:view];
        
        
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(10, imageView.frame.size.height-40, imageView.frame.size.width, 40)];
        label.text=titleArray[i];
        label.font=[UIFont systemFontOfSize:14];
        label.textColor=[UIColor whiteColor];
        label.backgroundColor=[UIColor blackColor];
        [imageView addSubview:label];
        
        
        [imageView setImageWithURL:[NSURL URLWithString:array[i]]];
        
        [_srollView addSubview:imageView];

        
    }
    _page.currentPage = 0;
    _page.numberOfPages = array.count;

    //删除旧数据
    [_dataArr removeAllObjects];
    //添加新数据
    [_dataArr addObjectsFromArray:array];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (_isRunning == NO) {
        _index = _srollView.contentOffset.x/self.frame.size.width;
        if (_index == _oldIndex) {
            if (_index == _dataArr.count -1) {
                _index = 0;
            }
            else{
                _index = _dataArr.count -1;
            }
        }
        _page.currentPage = _index;
        _label.text = _dataArr[_index];
        _srollView.contentOffset = CGPointMake(self.frame.size.width*_index, 0);
        _oldIndex = _index;
        sleep(1);
        [_timer setFireDate:[NSDate distantPast]];
        _isRunning = YES;
    }
    else{
        if (_index == _dataArr.count) {
            _index = 0;
        }
        _page.currentPage = _index;
        _srollView.contentOffset = CGPointMake(self.frame.size.width*_index, 0);
        _index++;
    }
    
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    if (_isRunning == YES) {
        [_timer setFireDate:[NSDate distantFuture]];
        _isRunning = NO;
    }
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if (_isRunning == NO) {
            [_timer setFireDate:[NSDate distantPast]];
            _isRunning = YES;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
