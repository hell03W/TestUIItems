//
//  TestWHStarsViewController.m
//  TestUIItems
//
//  Created by  www.6dao.cc on 16/1/14.
//  Copyright © 2016年 www.6dao.com. All rights reserved.
//

#import "TestWHStarsViewController.h"
#import "WHStars.h"

@interface TestWHStarsViewController ()

@end

@implementation TestWHStarsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configUI];
}

- (void)configUI
{
    WHStars *stars1 = [WHStars starWithStarNumber:7 fillStarNumber:2.5];
    [self.view addSubview:stars1];
    stars1.frame = CGRectMake(10, 80, 200, 30);
    stars1.backgroundColor = [UIColor lightGrayColor];
    
    stars1.clickAble = YES;
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
