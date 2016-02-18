//
//  TestWHButton.m
//  TestUIItems
//
//  Created by  www.6dao.cc on 16/1/5.
//  Copyright © 2016年 www.6dao.com. All rights reserved.
//

#import "TestWHButton.h"
#import "WHButton.h"

@implementation TestWHButton

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadMainView];
    
    [self loadMainView1];
}

- (void)loadMainView
{
    WHButton *customBtn1 = [WHButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:customBtn1];
    customBtn1.frame = CGRectMake(110, 40, 100, 100);
    [customBtn1 setTitle:@"title" forState:0];
    [customBtn1 setImage:[UIImage imageNamed:@"zx-diban@2x"] forState:0];
    customBtn1.buttonStyle = WHButtonStyleImageTop;
    
    WHButton *customBtn2 = [WHButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:customBtn2];
    customBtn2.frame = CGRectMake(110, 150, 100, 100);
    [customBtn2 setTitle:@"title" forState:0];
    [customBtn2 setImage:[UIImage imageNamed:@"zx-diban@2x"] forState:0];
    customBtn2.buttonStyle = WHButtonStyleImageBottom;
    
    WHButton *customBtn3 = [WHButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:customBtn3];
    customBtn3.frame = CGRectMake(110, 260, 100, 100);
    [customBtn3 setTitle:@"title" forState:0];
    [customBtn3 setImage:[UIImage imageNamed:@"zx-diban@2x"] forState:0];
    customBtn3.buttonStyle = WHButtonStyleImageLeft;
    
    WHButton *customBtn4 = [WHButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:customBtn4];
    customBtn4.frame = CGRectMake(110, 370, 100, 100);
    [customBtn4 setTitle:@"title" forState:0];
    [customBtn4 setImage:[UIImage imageNamed:@"zx-diban@2x"] forState:0];
    customBtn4.buttonStyle = WHButtonStyleLeftAlignment;
    customBtn4.subitemsSpace = 6;
    
    WHButton *customBtn5 = [WHButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:customBtn5];
    customBtn5.frame = CGRectMake(110, 480, 100, 100);
    [customBtn5 setTitle:@"title" forState:0];
    [customBtn5 setImage:[UIImage imageNamed:@"zx-diban@2x"] forState:0];
    customBtn5.buttonStyle = WHButtonStyleImageRight;
    
    customBtn1.backgroundColor = [UIColor lightGrayColor];
    customBtn2.backgroundColor = [UIColor lightGrayColor];
    customBtn3.backgroundColor = [UIColor lightGrayColor];
    customBtn4.backgroundColor = [UIColor lightGrayColor];
    customBtn5.backgroundColor = [UIColor lightGrayColor];
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
