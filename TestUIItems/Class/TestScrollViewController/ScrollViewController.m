//
//  ScrollViewController.m
//  ScrollBackgroundDemo
//
//  Created by Walden on 16/2/16.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "ScrollViewController.h"

#define kWindowWidth [[UIScreen mainScreen] bounds].size.width
#define kWindowHeight [[UIScreen mainScreen] bounds].size.height

@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self ConfigurationScrollViewController];
}

- (void)ConfigurationScrollViewController
{
    // 1, 创建并设置UIScrollView
    _scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:_scrollView];
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.frame = self.view.bounds;
    
    // 2, 创建并设置slideView, UIScrollView上层的一个View用于承载所有的子控件
    _slideView = [[UIView alloc] initWithFrame:self.view.bounds];
    _slideView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_slideView];
    
    
//#warning mark - 模拟测试代码, 使用时候需要删除掉, 根据需要在子类或者类外部设置和修改
//    [self setBackgroundColor:[UIColor yellowColor] foregroundColor:[UIColor grayColor]];
//    [self setScrollViewHeight:1500];
}

// 设置可滑动的高度
- (void)setSlideViewHeight:(float)slideViewHeight
{
    _slideViewHeight = slideViewHeight;
    
    // 1, 设置UIScrollView的contentSize
    CGSize size = CGSizeMake(kWindowWidth, self.view.frame.size.height + 0.3);
    if (_slideViewHeight >= kWindowHeight + 0.3) {
        size.height = _slideViewHeight;
    }
    _scrollView.contentSize = size;
    
    // 2, 设置UIScrollView上面UIView的高度 和 可滑动高度相等
    CGRect frame = _slideView.frame;
    frame.size.height = _slideViewHeight;
    _slideView.frame = frame;
}

//设置前景色和背景色
- (void)setBackgroundColor:(UIColor *)bgColor foregroundColor:(UIColor *)foreColor
{
    _scrollView.backgroundColor = bgColor;
    _slideView.backgroundColor = foreColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
