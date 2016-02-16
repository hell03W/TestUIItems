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

@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, strong) UIColor *foreColor;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self ConfigurationScrollViewController];
}

- (void)ConfigurationScrollViewController
{
    _scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:_scrollView];
    _scrollView.backgroundColor = _bgColor ? _bgColor : [UIColor whiteColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.frame = self.view.bounds;
    [self setContentSizeHeight:0];
    
    _slideView = [[UIView alloc] initWithFrame:self.view.bounds];
    _slideView.backgroundColor = _foreColor ? _foreColor : [UIColor whiteColor];
    [_scrollView addSubview:_slideView];
    
//#warning mark - 模拟测试代码, 使用时候需要删除掉, 根据需要在子类或者类外部设置和修改
//    [self setBackgroundColor:[UIColor yellowColor] foregroundColor:[UIColor grayColor]];
//    [self setScrollViewHeight:1500];
}

- (void)setScrollViewHeight:(float)scrollViewHeight
{
    _slideViewHeight = scrollViewHeight;
    
    [self setContentSizeHeight:scrollViewHeight];
    CGRect frame = _slideView.frame;
    frame.size.height = _slideViewHeight;
    _slideView.frame = frame;
}

- (void)setContentSizeHeight:(float)height
{
    CGSize size = CGSizeMake(kWindowWidth, self.view.frame.size.height + 0.3);
    if (height >= kWindowHeight + 0.3) {
        size.height = height;
    }
    
    _scrollView.contentSize = size;
}

- (void)setBackgroundColor:(UIColor *)bgColor foregroundColor:(UIColor *)foreColor
{
    _bgColor= bgColor;
    _foreColor= foreColor;
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
