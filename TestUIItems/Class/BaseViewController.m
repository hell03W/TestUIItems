//
//  BaseViewController.m
//  TestUIItems
//
//  Created by  www.6dao.cc on 16/1/5.
//  Copyright © 2016年 www.6dao.com. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadMainView1];
    
}

- (void)loadMainView1
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    [btn setTitle:@"返回" forState:0];
    btn.frame = CGRectMake(20, 20, 80, 30);
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:64];
    btn.backgroundColor = [UIColor lightGrayColor];
}

- (void)btnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
