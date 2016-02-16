//
//  ScrollViewController.h
//  ScrollBackgroundDemo
//
//  Created by Walden on 16/2/16.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewController : UIViewController

@property (nonatomic, strong) UIScrollView  *scrollView; // 控制滑动的UIScrollView
@property (nonatomic, strong) UIView        *slideView; // 放在UIScrollView上面的一层view, 根据具体情况在这个view上面放置具体的子控件
@property (nonatomic, assign) float         slideViewHeight; // 设置可滑动部分的高度, 最低和默认是屏幕的高度

// 设置滑动后漏出来的的背景色和前景色
- (void)setBackgroundColor:(UIColor *)bgColor foregroundColor:(UIColor *)foreColor;

@end
