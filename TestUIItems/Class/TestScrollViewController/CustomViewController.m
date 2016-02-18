//
//  CustomViewController.m
//  TestUIItems
//
//  Created by Walden on 16/2/16.
//  Copyright © 2016年 www.6dao.com. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController ()

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBackgroundColor:[UIColor lightGrayColor] foregroundColor:[UIColor redColor]];
    self.slideViewHeight = 1000;
    
    
    
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.slideView addSubview:backBtn];
    backBtn.frame = CGRectMake(20, 40, 120, 40);
    [backBtn setTitle:@"返回" forState:0];
    [backBtn setTitleColor:[UIColor lightGrayColor] forState:0];
    [backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:64];
    backBtn.layer.cornerRadius = 5;
    backBtn.layer.borderColor = [[UIColor whiteColor] CGColor];
    backBtn.layer.borderWidth = 0.5;
}

- (void)backBtnClick:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
